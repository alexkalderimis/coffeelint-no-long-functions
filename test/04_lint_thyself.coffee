fs = require 'fs'

CoffeeLint = require 'coffeelint'
Rule = require '../'
CoffeeLint.registerRule Rule

describe 'The source code of this module', ->

  src = fs.readFileSync __dirname + '/../index.coffee', 'utf8'
  errors = CoffeeLint.lint src

  it 'should pass its own rules', ->
    errors.length.should.eql 0

