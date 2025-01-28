#set page(height:auto, width: 6cm, margin: 1em)
#import "@preview/clocks:1.0.0"

// You can draw "empty" clock faces
#clocks.clock()
// Clock with hour hand only.
#clocks.clock(hours: 1)
// Clock with minute hand only.
#clocks.clock(minutes: 25)
// Clock with hour and minute hands.
#clocks.clock(hours: 3, minutes: 30)
// You may adjust the default diameter of 3em
#clocks.clock(diameter: 5em, hours: 3, minutes: 30)
// And you may adjust the 
#clocks.clock(diameter: 5em, hours: 3, minutes: 30, stroke: (blue + 2pt))

Adding a clock "inline" is also possible, just set the `diameter` attribute as small as `0.7em`. As you can see, the readability requires an adjustment of the stroke to `0.6pt` as well. #clocks.clock(diameter: 0.7em, hours: 11, minutes: 55, stroke: (0.6pt))



