fs = require 'fs'

CoffeeLint = require 'coffeelint'
Rule = require '../'
CoffeeLint.registerRule Rule

config =
  no_long_functions:
    value: 5

describe 'A file with a long function', ->

  src = fs.readFileSync __dirname + '/../test-cases/one-long-function.coffee', 'utf8'

  errors = CoffeeLint.lint src, config

  it 'should report one error', ->
    errors.length.should.eql 1

  it 'should have reported the function that goes from 7-13', ->
    error = errors[0]
    error.lineNumber.should.eql 7
    error.lineNumberEnd.should.eql 13

describe 'A file with a long method', ->

  src = fs.readFileSync __dirname + '/../test-cases/bad-class.coffee', 'utf8'

  errors = CoffeeLint.lint src, config

  it 'should report one error', ->
    errors.length.should.eql 1

  it 'should have reported the function that goes from 8-14', ->
    error = errors[0]
    error.lineNumber.should.eql 8
    error.lineNumberEnd.should.eql 14


