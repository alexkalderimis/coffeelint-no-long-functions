
foo = -> 1

bar = (x) ->
  x += 1

quux = (x) ->
  w = x * x
  y = x - w
  z = "#{ z }-#{ z }"
  nested = ->
    bar
  return nested z

