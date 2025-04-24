#import "lib.typ": *

#figure(canvas({
  import draw: *
  steane_code((0, 0), size: 3)
    for j in range(7) {
      content((rel: (0, -0.3), to: "steane" + "_" + str(j+1)), [#(j)])
    }
}),caption: [
   Steane code with labels.
])

#figure(canvas({
  import draw: *
  let n = 3
  surface_code((0, 0),size:1.5, n, n,name: "surface1")
  for i in range(n) {
    for j in range(n) {
      content((rel: (0.3, 0.3), to: "surface1" + "_" + str(i) + "_" + str(j)), [#(i*n+j+1)])
    }
  }
  surface_code((4, 0),color1:red,color2:green,size:0.5, 15, 7)
  }),caption: [
  Surface codes examples.
])
#figure(canvas({
  import draw: *
  let n = 5
  surface_code((0, 0), n, n, color1: aqua, color2: yellow, type_tag: false, name: "left")
  surface_code((5, 0), n, n, color1: yellow, color2: aqua, name: "right")
  stabilizer_label((12, 3))

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
  $overline(Z)_1 overline(Z)_2$ measurement with lattice surgery between two surface codes.
])

#figure(canvas({
  import draw: *
  let m = 5
  let n = 3
  let size = 2
  let circle_radius = 0.4
  toric_code((0, 0), m, n, size: size, circle_radius: circle_radius)
  plaquette_code_label((0, 0),2,0,((-1,0),(-1,1)),((0,0),(-1,0)), size: size, circle_radius: circle_radius)
  vertex_code_label((0, 0),3,2,((-1,0),(0,0)),((0,0),(0,-1)), size: size, circle_radius: circle_radius)
  stabilizer_label((12, -2))
  for i in range(m){
    for j in range(n){
      content( "toric_point_vertical_" + str(i) + "_" + str(j), [#(i*n+j+1)])
      content( "toric_point_horizontal_" + str(i) + "_" + str(j), [#(i*n+j+1+m*n)])
    }
  }
}),caption: [
    Toric code with labels.
])

#figure(canvas({
  import draw: *
  toric_code((0, 0), 7, 7, size: 1)
  plaquette_code_label((0, 0),2,4,((-1,0),(2,1),(3,1)),((0,0),(-1,-4),(-1,-3)), size: 1)
  vertex_code_label((0, 0),6,1,((-1,0),(0,4),(0,3)),((-4,-1),(0,0),(-3,-1)), size: 1)
  stabilizer_label((10, -3))
}),caption: [
    A $〚98,8,12〛$ BB code.
])