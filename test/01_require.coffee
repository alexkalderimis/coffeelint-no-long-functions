describe  'Requiring the main library', ->

  it 'should be possible to require this library', ->
    require '../'

  it 'should return a constructor', ->
    Rule = require '../'
    rule = new Rule
