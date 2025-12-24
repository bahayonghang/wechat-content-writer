#!/usr/bin/env node

/**
 * Simple Search Server for WeChat Content Writer Plugin
 * Provides basic search functionality without external dependencies
 */

const http = require('http');
const url = require('url');

const PORT = process.env.PORT || 3001;

/**
 * Simple search implementation using mock data
 */
function performSearch(query, type = 'web') {
  // Mock search results for demonstration
  const mockResults = {
    academic: [
      {
        id: '1',
        title: `${query} - Recent Advances in AI Research`,
        summary: `Comprehensive analysis of recent developments in ${query}...`,
        authors: ['Dr. Smith', 'Dr. Johnson'],
        published: '2024-01-15',
        link: 'https://example.com/paper1',
        source: 'academic'
      },
      {
        id: '2',
        title: `Understanding ${query}: A Comprehensive Survey`,
        summary: `This paper provides a thorough survey of ${query} techniques...`,
        authors: ['Research Team'],
        published: '2024-01-10',
        link: 'https://example.com/paper2',
        source: 'academic'
      }
    ],
    web: [
      {
        id: '1',
        title: `Latest ${query} trends and developments`,
        summary: `Explore the most recent trends in ${query}...`,
        url: 'https://example.com/article1',
        published: '2024-01-20',
        source: 'web'
      },
      {
        id: '2',
        title: `How ${query} is transforming industries`,
        summary: `Discover the impact of ${query} across various sectors...`,
        url: 'https://example.com/article2',
        published: '2024-01-18',
        source: 'web'
      }
    ]
  };

  return mockResults[type] || mockResults.web;
}

/**
 * HTTP request handler
 */
const server = http.createServer((req, res) => {
  // Enable CORS
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') {
    res.writeHead(200);
    res.end();
    return;
  }

  const parsedUrl = url.parse(req.url, true);
  const { pathname } = parsedUrl;

  try {
    if (req.method === 'GET' && pathname === '/health') {
      res.writeHead(200, { 'Content-Type': 'application/json' });
      res.end(JSON.stringify({
        status: 'healthy',
        timestamp: new Date().toISOString(),
        version: '1.0.0'
      }));
      return;
    }

    if (req.method === 'POST' && pathname === '/search') {
      let body = '';
      req.on('data', chunk => {
        body += chunk.toString();
      });

      req.on('end', () => {
        try {
          const { query, type = 'web', limit = 10 } = JSON.parse(body);

          if (!query) {
            res.writeHead(400, { 'Content-Type': 'application/json' });
            res.end(JSON.stringify({ error: 'Query parameter is required' }));
            return;
          }

          const results = performSearch(query, type);
          const limitedResults = results.slice(0, limit);

          res.writeHead(200, { 'Content-Type': 'application/json' });
          res.end(JSON.stringify({
            query,
            type,
            totalResults: limitedResults.length,
            results: limitedResults,
            timestamp: new Date().toISOString()
          }));

        } catch (error) {
          res.writeHead(400, { 'Content-Type': 'application/json' });
          res.end(JSON.stringify({ error: 'Invalid JSON', details: error.message }));
        }
      });
      return;
    }

    // 404 for unknown routes
    res.writeHead(404, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ error: 'Not found' }));

  } catch (error) {
    console.error('Server error:', error);
    res.writeHead(500, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ error: 'Internal server error', details: error.message }));
  }
});

/**
 * Graceful shutdown
 */
process.on('SIGTERM', () => {
  console.log('Received SIGTERM, shutting down gracefully');
  server.close(() => {
    console.log('Server closed');
    process.exit(0);
  });
});

process.on('SIGINT', () => {
  console.log('Received SIGINT, shutting down gracefully');
  server.close(() => {
    console.log('Server closed');
    process.exit(0);
  });
});

/**
 * Start server
 */
server.listen(PORT, () => {
  console.log(`WeChat Content Writer Search Server running on port ${PORT}`);
  console.log(`Health check: http://localhost:${PORT}/health`);
  console.log(`Search endpoint: http://localhost:${PORT}/search`);
  console.log(`Available endpoints:`);
  console.log(`  GET  /health - Health check`);
  console.log(`  POST /search  - Search for content`);
});

module.exports = server;