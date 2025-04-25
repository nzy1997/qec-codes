#import "../lib.typ": *
#set page(width: auto, height: auto, margin: 5pt)

#canvas({
  import draw: *
  surface_code((0, 0), 5, 5, color1: aqua, color2: yellow, type_tag: false, name: "left")
  surface_code((5, 0), 5, 5, color1: yellow, color2: aqua, type_tag: false, name: "right")
  stabilizer_label((12, 3))
  for i in range(5){
    let color3 = if (calc.rem(i, 2) == 0) {
      yellow
    } else {
      aqua
    }
    circle((4+0.5, i - 0.5), radius: 0.1, fill: color3, stroke: none, name: "control" + str(i))
    line("control" + str(i), "left_4_" + str(i), stroke: color3)
    line("control" + str(i), "right_0_" + str(i), stroke: color3)
    if i != 0 {
      line("control" + str(i), "left_4_" + str(i - 1), stroke: color3)
      line("control" + str(i), "right_0_" + str(i - 1), stroke: color3)        
    }
  }
})