#import "lib.typ": *


#figure(canvas({
  import draw: *
  let n = 5
  surface_code((0, 0), n, n, color1: aqua, color2: yellow, type_tag: false, name: "left")
  surface_code((5, 0), n, n, color1: yellow, color2: aqua, name: "right")
  surface_code_label((12, 3))

  for i in range(n) {
    for j in range(n) {
      content((rel: (0.3, 0.3), to: "left" + "_" + str(i) + "_" + str(j)), [#(i),#j])
    }
  }

  for i in range(n - 1) {
    for j in range(n - 1) {
      content("left_square" + "_" + str(i) + "_" + str(j) + ".north", [#(i),#j])
    }
  }
  for i in range(5){
    // let color3 = red
    if (calc.rem(i, 2) == 0) {
      let color3 = yellow
          circle((4+0.5, i - 0.5), radius: 0.1, fill: color3, stroke: none, name: "control" + str(i))
    line("control" + str(i), (4, i), stroke: color3)
    line("control" + str(i), (5, i), stroke: color3)

    if i != 0{
      line("control" + str(i), (5, i - 1), stroke: color3)
      line("control" + str(i), (4, i - 1), stroke: color3)        
    }
    }else{
      let color3 = aqua
          circle((4+0.5, i - 0.5), radius: 0.1, fill: color3, stroke: none, name: "control" + str(i))
    line("control" + str(i), (4, i), stroke: color3)
    line("control" + str(i), (5, i), stroke: color3)

    if i != 0{
      line("control" + str(i), (5, i - 1), stroke: color3)
      line("control" + str(i), (4, i - 1), stroke: color3)        
    }
    }
  }
}),caption: [
  $overline(Z)_1 overline(Z)_2$ measurement with lattice surgery between two surface codes with code distance $d = 5$.
])

#figure(canvas({
  import draw: *
  steane_code((0, 0), size: 3)
}))

#figure(canvas({
  import draw: *
  toric_code((0, 0), 3, 3, size: 1)
  }))