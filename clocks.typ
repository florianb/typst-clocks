// Helper function:
// Transforms (moves) coordinates by the given amount on x and y
// axis.
#let _transform(coordinates, x: 0mm, y: 0mm) = {
  (coordinates.at(0) + x, coordinates.at(1) + y)
}

// Helper function:
// Calculates the endpoint of a line by radius and degree.
// The endpont refers to the second point of a line coming
// from the center of the circle.
#let _coordinates(radius, degree) = {
  let sin = calc.sin(degree)
  let cos = calc.cos(degree)

  (radius * sin, radius * cos)
}

// Draws a clock with the given diameter.
#let clock(diameter: 3em, hours: none, minutes: none, stroke: none) = {
  let radius = diameter / 2
  let inner_radius = radius * 0.9
  let indices = array.range(0, 360, step: 30).map(v => v * 1deg)

  if stroke == none {
    stroke = (thickness: diameter * 1%)
  }

  box(width: diameter, height: diameter, {
    circle(stroke: stroke, radius: radius)
    
    for indice in indices {
      let x_transform = radius
      let y_transform = -radius
      
      let start = _transform(_coordinates(radius, indice), x: x_transform, y: y_transform)
      let end = _transform(_coordinates(inner_radius, indice), x: x_transform, y: y_transform)
  
      place({
        line(stroke: stroke, start: start, end: end)
      })
    }
  
    if hours != none and hours >= 0 and hours <= 12 {
      let degree = 30deg * hours - 90deg
      let length = diameter * 30%
  
      if minutes != none and minutes>= 0 and minutes<= 60 {
        degree += 0.5deg * minutes
      }
  
      place(dy: -radius, dx: radius, {
        line(stroke: stroke, angle: degree, length: length)
      })
    }
  
    if minutes != none and minutes>= 0 and minutes<= 60 {
      let degree = 6deg * minutes - 90deg
      let length = diameter * 40%
      
      place(dy: -radius, dx: radius, {
        line(stroke: stroke, angle: degree, length: length)
      })
    }
  })
}
