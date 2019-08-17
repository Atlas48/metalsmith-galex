const galex = require('..');
var metalsmith, assert;
metalsmith = require('metalsmith');
assert = require('assert');
writemetadata = require('writemetadata');

function er(e) { if(e) return e; }

function t1() {
  metalsmith(__dirname)
   .source('source')
   .destination('out')
   .use(galex())
   .use(write-metadata({
     pattern: ['**/*'],
     bufferencoding: 'utf-8'
   }))
   .build(er);
}

describe('metalsmith-galex', => {
  it('should output a galex object', t1);
