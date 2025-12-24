#!/usr/bin/env node

/**
 * Web Search Server for WeChat Content Writer Plugin
 * Provides search capabilities for academic literature and web content discovery
 */

const express = require('express');
const cors = require('cors');
const axios = require('axios');
const { JSDOM } = require('jsdom');

const app = express();
const PORT = process.env.PORT || 3001;

// Middleware
app.use(cors());
app.use(express.json());

// Configuration
const SEARCH_CONFIG = {
  // Default search engines (can be extended with API keys)
  sources: [
    {
      name: 'arxiv',
      baseUrl: 'http://export.arxiv.org/api/query',
      type: 'academic'
    },
    {
      name: 'google-scholar',
      baseUrl: 'https://serpapi.com/search',
      type: 'academic',
      requiresApiKey: true
    }
  ]
};

/**
 * Health check endpoint
 */
app.get('/health', (req, res) => {
  res.json({ status: 'healthy', timestamp: new Date().toISOString() });
});

/**
 * Search endpoint for academic literature
 */
app.post('/search/academic', async (req, res) => {
  try {
    const { query, limit = 10, fields = ['computer-science', 'artificial-intelligence'] } = req.body;

    if (!query) {
      return res.status(400).json({ error: 'Query parameter is required' });
    }

    // Search arXiv
    const arxivResults = await searchArxiv(query, limit, fields);

    // If Google Scholar API key is available, search there too
    let scholarResults = [];
    if (process.env.SEARCH_API_KEY) {
      scholarResults = await searchGoogleScholar(query, limit);
    }

    // Combine and rank results
    const allResults = combineAndRankResults(arxivResults, scholarResults, limit);

    res.json({
      query,
      totalResults: allResults.length,
      results: allResults,
      sources: ['arxiv', ...(process.env.SEARCH_API_KEY ? ['google-scholar'] : [])]
    });

  } catch (error) {
    console.error('Search error:', error);
    res.status(500).json({ error: 'Search failed', details: error.message });
  }
});

/**
 * Search endpoint for general web content
 */
app.post('/search/web', async (req, res) => {
  try {
    const { query, limit = 10, language = 'zh-CN' } = req.body;

    if (!query) {
      return res.status(400).json({ error: 'Query parameter is required' });
    }

    // Use various search strategies based on available APIs
    let results = [];

    if (process.env.SEARCH_API_KEY) {
      results = await searchWithAPI(query, limit, language);
    } else {
      // Fallback to free search methods
      results = await searchFree(query, limit, language);
    }

    res.json({
      query,
      totalResults: results.length,
      results,
      searchMethod: process.env.SEARCH_API_KEY ? 'api' : 'free'
    });

  } catch (error) {
    console.error('Web search error:', error);
    res.status(500).json({ error: 'Web search failed', details: error.message });
  }
});

/**
 * Content analysis endpoint
 */
app.post('/analyze/content', async (req, res) => {
  try {
    const { url, contentType = 'article' } = req.body;

    if (!url) {
      return res.status(400).json({ error: 'URL parameter is required' });
    }

    // Fetch and analyze content
    const analysis = await analyzeContent(url, contentType);

    res.json({
      url,
      contentType,
      analysis,
      timestamp: new Date().toISOString()
    });

  } catch (error) {
    console.error('Content analysis error:', error);
    res.status(500).json({ error: 'Content analysis failed', details: error.message });
  }
});

/**
 * Search arXiv for academic papers
 */
async function searchArxiv(query, limit, fields) {
  try {
    const searchQuery = buildArxivQuery(query, fields);
    const url = `http://export.arxiv.org/api/query?search_query=${searchQuery}&start=0&max_results=${limit}`;

    const response = await axios.get(url);
    const dom = new JSDOM(response.data, { contentType: 'text/xml' });
    const entries = dom.window.document.querySelectorAll('entry');

    return Array.from(entries).map(entry => ({
      id: entry.querySelector('id')?.textContent || '',
      title: entry.querySelector('title')?.textContent?.trim() || '',
      summary: entry.querySelector('summary')?.textContent?.trim() || '',
      authors: Array.from(entry.querySelectorAll('author name')).map(author => author.textContent || ''),
      published: entry.querySelector('published')?.textContent || '',
      categories: Array.from(entry.querySelectorAll('category')).map(cat => cat.getAttribute('term') || ''),
      link: entry.querySelector('id')?.textContent || '',
      source: 'arxiv'
    }));

  } catch (error) {
    console.error('arXiv search error:', error);
    return [];
  }
}

/**
 * Search Google Scholar (requires API key)
 */
async function searchGoogleScholar(query, limit) {
  try {
    const apiUrl = 'https://serpapi.com/search.json';
    const params = {
      engine: 'google_scholar',
      q: query,
      num: limit,
      api_key: process.env.SEARCH_API_KEY
    };

    const response = await axios.get(apiUrl, { params });

    return (response.data.organic_results || []).map(result => ({
      id: result.result_id || '',
      title: result.title || '',
      summary: result.snippet || '',
      authors: (result.publication_info?.authors || []).map(author => author.name || ''),
      published: result.publication_info?.year || '',
      categories: [], // Google Scholar doesn't provide categories
      link: result.link || '',
      source: 'google-scholar',
      publication: result.publication_info?.summary || '',
      cited_by: result.inline_links?.cited_by?.total || 0
    }));

  } catch (error) {
    console.error('Google Scholar search error:', error);
    return [];
  }
}

/**
 * Build arXiv search query
 */
function buildArxivQuery(query, fields) {
  const fieldQueries = fields.map(field => `cat:${field}`).join(' OR ');
  return `(${fieldQueries}) AND all:"${query}"`;
}

/**
 * Combine and rank search results
 */
function combineAndRankResults(arxivResults, scholarResults, limit) {
  const allResults = [...arxivResults, ...scholarResults];

  // Remove duplicates based on title similarity
  const uniqueResults = allResults.filter((item, index, arr) =>
    index === arr.findIndex(other =>
      item.title.toLowerCase().replace(/\s+/g, '') === other.title.toLowerCase().replace(/\s+/g, '')
    )
  );

  // Rank by recency and relevance (simple implementation)
  return uniqueResults
    .sort((a, b) => {
      const dateA = new Date(a.published || '1900-01-01');
      const dateB = new Date(b.published || '1900-01-01');
      return dateB.getTime() - dateA.getTime(); // More recent first
    })
    .slice(0, limit);
}

/**
 * Search with API (when API key is available)
 */
async function searchWithAPI(query, limit, language) {
  // Implementation depends on which API is configured
  // This is a placeholder for various search APIs
  return [];
}

/**
 * Free search methods
 */
async function searchFree(query, limit, language) {
  // Implementation of free search methods
  // This could include scraping publicly available sources
  return [];
}

/**
 * Analyze content from URL
 */
async function analyzeContent(url, contentType) {
  try {
    const response = await axios.get(url, {
      headers: {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
      }
    });

    const dom = new JSDOM(response.data);
    const document = dom.window.document;

    // Extract basic content information
    const title = document.querySelector('title')?.textContent || '';
    const description = document.querySelector('meta[name="description"]')?.getAttribute('content') || '';
    const keywords = document.querySelector('meta[name="keywords"]')?.getAttribute('content') || '';

    // Extract main content (basic implementation)
    const contentSelectors = ['article', 'main', '.content', '.post-content', '#content'];
    let mainContent = '';

    for (const selector of contentSelectors) {
      const element = document.querySelector(selector);
      if (element) {
        mainContent = element.textContent || '';
        break;
      }
    }

    // If no specific content found, use body
    if (!mainContent) {
      mainContent = document.body?.textContent || '';
    }

    return {
      title,
      description,
      keywords,
      contentLength: mainContent.length,
      wordCount: mainContent.split(/\s+/).length,
      contentType: detectContentType(mainContent),
      language: detectLanguage(mainContent),
      readabilityScore: calculateReadability(mainContent),
      keyTopics: extractKeyTopics(mainContent)
    };

  } catch (error) {
    throw new Error(`Failed to analyze content from ${url}: ${error.message}`);
  }
}

/**
 * Detect content type
 */
function detectContentType(content) {
  const patterns = {
    academic: /abstract|methodology|results|conclusion|references/i,
    tutorial: /step|tutorial|how to|guide|example/i,
    news: /breaking|latest|report|announced|according to/i,
    documentation: /function|class|method|parameter|return|API/i
  };

  for (const [type, pattern] of Object.entries(patterns)) {
    if (pattern.test(content)) {
      return type;
    }
  }

  return 'general';
}

/**
 * Detect language
 */
function detectLanguage(content) {
  // Simple language detection based on character patterns
  const chinesePattern = /[\u4e00-\u9fff]/;
  const englishPattern = /[a-zA-Z]/;

  const chineseMatches = (content.match(chinesePattern) || []).length;
  const englishMatches = (content.match(englishPattern) || []).length;

  if (chineseMatches > englishMatches) {
    return 'zh-CN';
  } else if (englishMatches > chineseMatches) {
    return 'en';
  } else {
    return 'unknown';
  }
}

/**
 * Calculate readability score (simplified)
 */
function calculateReadability(content) {
  const sentences = content.split(/[.!?]+/).length;
  const words = content.split(/\s+/).length;
  const avgWordsPerSentence = words / sentences;

  // Simple readability categorization
  if (avgWordsPerSentence < 10) return 'easy';
  if (avgWordsPerSentence < 20) return 'moderate';
  return 'difficult';
}

/**
 * Extract key topics
 */
function extractKeyTopics(content) {
  // Simple keyword extraction (placeholder implementation)
  const words = content.toLowerCase().split(/\W+/);
  const stopWords = new Set(['the', 'a', 'an', 'and', 'or', 'but', 'in', 'on', 'at', 'to', 'for', 'of', 'with', 'by', 'is', 'are', 'was', 'were']);

  const wordFreq = {};
  words.forEach(word => {
    if (word.length > 3 && !stopWords.has(word)) {
      wordFreq[word] = (wordFreq[word] || 0) + 1;
    }
  });

  return Object.entries(wordFreq)
    .sort(([,a], [,b]) => b - a)
    .slice(0, 10)
    .map(([word]) => word);
}

// Error handling middleware
app.use((error, req, res, next) => {
  console.error('Server error:', error);
  res.status(500).json({ error: 'Internal server error' });
});

// Start server
app.listen(PORT, () => {
  console.log(`WeChat Content Writer Search Server running on port ${PORT}`);
  console.log(`Available endpoints:`);
  console.log(`  GET  /health - Health check`);
  console.log(`  POST /search/academic - Academic literature search`);
  console.log(`  POST /search/web - General web search`);
  console.log(`  POST /analyze/content - Content analysis`);
});

module.exports = app;