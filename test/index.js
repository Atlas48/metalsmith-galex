const galex = require('..');
var metalsmith, assert, writemetadata, path;
metalsmith = require('metalsmith');
assert = require('assert');
writemetadata = require('metalsmith-writemetadata');
path = require('path');

function er(e) { if(e) return e; }

var s = [{ mimetypes:true, directory:__dirname },
{ pattern: ['**/*'], bufferencoding: 'utf-8' }];

function t1() {
  assert.equal(path.basename(__dirname), 'test');
  function i1() {
    metalsmith(__dirname)
      .source('source')
      .destination('out')
      .use(galex(s[0]))
      .use(writemetadata(s[1]))
      .build(er);
  }
  it('should output a galex object', i1);
};

describe('metalsmith-galex', t1);
