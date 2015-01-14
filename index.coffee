module.exports = class NoLongMethods

  rule:
    name: 'no_long_functions'
    message: 'Methods must not be longer than the given number of lines'
    level: 'error'
    value: 20
    description: 'Checks for method length'

  processFunction: (code, api, name) ->
    return unless code.body.expressions.length
    max = api.config[@rule.name]?.value
    firstLine = code.locationData.first_line + 1
    lastLine = code.locationData.last_line + 1

    if lastLine - firstLine > max
      @errors.push api.createError
        context: name
        message: "Functions must not be longer than #{max} lines"
        lineNumber: firstLine
        lineNumberEnd: lastLine

    @lintNode code.body, api

  lintNode: (node, api, name = 'Anon') ->
    node.traverseChildren false, (child) =>
      switch child.constructor.name
        when 'Code' then @processFunction child, api, name
    return # Errors are listed in @errors.

  lintAST: (root, api) -> @lintNode root, api
