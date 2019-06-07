dvl = require './core'
{ bind, bindSingle } = require './bind'

# SVG

clipId = 0
svgModule = {}
svgModule.clipPath = ({parent, x, y, width, height}) ->
  x = dvl.wrap(x or 0)
  y = dvl.wrap(y or 0)

  clipId++
  myId = "cp#{clipId}"
  p = dvl.valueOf(parent)
  cp = p.append('defs')
    .merge(p)
    .append('clipPath')
    .merge(p)
    .attr('id', myId)

  bind {
    parent: cp
    self: 'rect'
    attr: {
      x
      y
      width
      height
    }
  }

  return "url(##{myId})"


module.exports = svgModule
