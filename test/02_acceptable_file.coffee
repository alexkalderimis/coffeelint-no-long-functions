fs = require 'fs'

CoffeeLint = require 'coffeelint'
Rule = require '../'
CoffeeLint.registerRule Rule

describe 'An empty file', ->

  src = fs.readFileSync __dirname + '/../test-cases/empty.coffee', 'utf8'

  it 'should be acceptable', ->
    errors = CoffeeLint.lint src
    errors.length.should.eql 0

describe 'A file with short functions', ->

  src = fs.readFileSync __dirname + '/../test-cases/short-functions.coffee', 'utf8'

  it 'should be acceptable', ->
    errors = CoffeeLint.lint src
    errors.length.should.eql 0
