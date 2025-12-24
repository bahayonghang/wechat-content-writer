#!/usr/bin/env node

/**
 * Plugin Testing Script for WeChat Content Writer
 * Validates plugin structure and basic functionality
 */

const fs = require('fs');
const path = require('path');

const PLUGIN_ROOT = path.resolve(__dirname, '..');
const RESULTS = {
  passed: 0,
  failed: 0,
  errors: []
};

/**
 * Test helper functions
 */
function test(name, testFn) {
  try {
    const result = testFn();
    if (result) {
      console.log(`✅ ${name}`);
      RESULTS.passed++;
    } else {
      console.log(`❌ ${name}`);
      RESULTS.failed++;
      RESULTS.errors.push(`${name}: Test returned false`);
    }
  } catch (error) {
    console.log(`❌ ${name} - ${error.message}`);
    RESULTS.failed++;
    RESULTS.errors.push(`${name}: ${error.message}`);
  }
}

function fileExists(filePath) {
  return fs.existsSync(path.join(PLUGIN_ROOT, filePath));
}

function jsonValid(filePath) {
  try {
    const content = fs.readFileSync(path.join(PLUGIN_ROOT, filePath), 'utf8');
    JSON.parse(content);
    return true;
  } catch {
    return false;
  }
}

function frontMatterValid(filePath) {
  try {
    const content = fs.readFileSync(path.join(PLUGIN_ROOT, filePath), 'utf8');
    const frontMatterMatch = content.match(/^---\n([\s\S]*?)\n---/);
    if (!frontMatterMatch) return false;

    const frontMatter = frontMatterMatch[1];
    const requiredFields = ['name', 'description'];

    for (const field of requiredFields) {
      if (!frontMatter.includes(`${field}:`)) {
        return false;
      }
    }

    return true;
  } catch {
    return false;
  }
}

console.log('🔍 Testing WeChat Content Writer Plugin\n');

/**
 * Test plugin structure
 */
console.log('📂 Testing Plugin Structure');

test('Plugin root directory exists', () => fileExists('.'));
test('Plugin manifest exists', () => fileExists('.claude-plugin/plugin.json'));
test('Plugin manifest valid JSON', () => jsonValid('.claude-plugin/plugin.json'));
test('MCP configuration exists', () => fileExists('.mcp.json'));
test('MCP configuration valid JSON', () => jsonValid('.mcp.json'));
test('Package.json exists', () => fileExists('package.json'));
test('Package.json valid JSON', () => jsonValid('package.json'));
test('README.md exists', () => fileExists('README.md'));
test('.gitignore exists', () => fileExists('.gitignore'));

/**
 * Test directory structure
 */
console.log('\n📁 Testing Directory Structure');

test('Commands directory exists', () => fileExists('commands'));
test('Agents directory exists', () => fileExists('agents'));
test('Skills directory exists', () => fileExists('skills'));
test('Scripts directory exists', () => fileExists('scripts'));

/**
 * Test skills
 */
console.log('\n🧠 Testing Skills');

test('Literature research skill directory exists', () => fileExists('skills/literature-research'));
test('Literature research SKILL.md exists', () => fileExists('skills/literature-research/SKILL.md'));
test('Literature research skill valid frontmatter', () => frontMatterValid('skills/literature-research/SKILL.md'));
test('PDF analysis skill directory exists', () => fileExists('skills/pdf-analysis'));
test('PDF analysis SKILL.md exists', () => fileExists('skills/pdf-analysis/SKILL.md'));
test('PDF analysis skill valid frontmatter', () => frontMatterValid('skills/pdf-analysis/SKILL.md'));

/**
 * Test commands
 */
console.log('\n⚡ Testing Commands');

const commands = ['search-content', 'create-article', 'manage-categories'];
commands.forEach(command => {
  test(`${command} command exists`, () => fileExists(`commands/${command}.md`));
  test(`${command} command valid frontmatter`, () => frontMatterValid(`commands/${command}.md`));
});

/**
 * Test agents
 */
console.log('\n🤖 Testing Agents');

test('Content writer agent exists', () => fileExists('agents/content-writer.md'));
test('Content writer agent valid frontmatter', () => frontMatterValid('agents/content-writer.md'));

/**
 * Test scripts
 */
console.log('\n📜 Testing Scripts');

test('Search server script exists', () => fileExists('scripts/search-server.js'));

/**
 * Test content quality
 */
console.log('\n📝 Testing Content Quality');

function skillContentQuality(skillPath) {
  try {
    const content = fs.readFileSync(path.join(PLUGIN_ROOT, skillPath), 'utf8');
    const wordCount = content.split(/\s+/).length;
    return wordCount >= 500 && wordCount <= 5000; // Reasonable length
  } catch {
    return false;
  }
}

function commandContentQuality(commandPath) {
  try {
    const content = fs.readFileSync(path.join(PLUGIN_ROOT, commandPath), 'utf8');
    return content.includes('Usage:') && content.includes('Examples:');
  } catch {
    return false;
  }
}

test('Literature research skill content quality', () => skillContentQuality('skills/literature-research/SKILL.md'));
test('PDF analysis skill content quality', () => skillContentQuality('skills/pdf-analysis/SKILL.md'));

commands.forEach(command => {
  test(`${command} command content quality`, () => commandContentQuality(`commands/${command}.md`));
});

/**
 * Test plugin manifest
 */
console.log('\n⚙️ Testing Plugin Configuration');

try {
  const manifest = JSON.parse(fs.readFileSync(path.join(PLUGIN_ROOT, '.claude-plugin/plugin.json'), 'utf8'));

  test('Plugin has name', () => manifest.name && manifest.name.length > 0);
  test('Plugin has version', () => manifest.version && manifest.version.length > 0);
  test('Plugin has description', () => manifest.description && manifest.description.length > 0);
  test('Plugin name uses kebab-case', () => /^[a-z0-9-]+$/.test(manifest.name));

} catch (error) {
  console.log(`❌ Plugin manifest test failed - ${error.message}`);
  RESULTS.failed++;
  RESULTS.errors.push(`Plugin manifest: ${error.message}`);
}

/**
 * Test package dependencies
 */
console.log('\n📦 Testing Dependencies');

try {
  const packageJson = JSON.parse(fs.readFileSync(path.join(PLUGIN_ROOT, 'package.json'), 'utf8'));

  test('Package has required dependencies', () => {
    const deps = packageJson.dependencies || {};
    return deps.express && deps.axios;
  });

} catch (error) {
  console.log(`❌ Package dependencies test failed - ${error.message}`);
  RESULTS.failed++;
  RESULTS.errors.push(`Package dependencies: ${error.message}`);
}

/**
 * Test search server syntax
 */
console.log('\n🌐 Testing Search Server');

test('Search server syntax valid', () => {
  try {
    // Basic syntax check by requiring the file
    delete require.cache[path.join(PLUGIN_ROOT, 'scripts/search-server.js')];
    require(path.join(PLUGIN_ROOT, 'scripts/search-server.js'));
    return true;
  } catch {
    return false;
  }
});

/**
 * Results summary
 */
console.log('\n' + '='.repeat(50));
console.log('📊 Test Results Summary');
console.log('='.repeat(50));

console.log(`✅ Passed: ${RESULTS.passed}`);
console.log(`❌ Failed: ${RESULTS.failed}`);

if (RESULTS.errors.length > 0) {
  console.log('\n🔴 Errors:');
  RESULTS.errors.forEach(error => console.log(`   - ${error}`));
}

const totalTests = RESULTS.passed + RESULTS.failed;
const successRate = ((RESULTS.passed / totalTests) * 100).toFixed(1);

console.log(`\n📈 Success Rate: ${successRate}%`);

if (RESULTS.failed === 0) {
  console.log('\n🎉 All tests passed! Plugin is ready for use.');
  process.exit(0);
} else {
  console.log('\n⚠️ Some tests failed. Please review and fix the issues above.');
  process.exit(1);
}