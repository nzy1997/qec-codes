#import "@preview/cetz:0.2.2": canvas,draw


#let steane_code(loc,size:4, color1:yellow, color2:aqua,color3:olive,name: "steane",point_radius:0.1) = {
  import draw: *
  let x = loc.at(0) 
  let y = loc.at(1)
  let locp_vec = ((x - calc.sqrt(3)*size/2,y  - size/2),(x,y - size/2),(x + calc.sqrt(3)*size/2,y  - size/2),(x,y + size),(x - calc.sqrt(3)*size/4,y + size/4),(x + calc.sqrt(3)*size/4,y + size/4),(x,y))
  for (i, locp) in locp_vec.enumerate() {
    circle(locp, radius: point_radius, fill: black, stroke: none, name: name + "_" + str(i + 1))
  }

  for ((i,j,k,l),color) in (((1,2,7,5),color1),((2,3,6,7),color2),((4,5,7,6),color3)) {
    line(name + "_" + str(i), name + "_" + str(j), name + "_" + str(k), name + "_" + str(l), name + "_" + str(i), fill: color)
  }

  for (i, locp) in locp_vec.enumerate() {
    circle(locp, radius: point_radius, fill: black, stroke: none)
  }
}

#let surface_code(loc, m, n, size:1, color1:yellow, color2:aqua, name: "surface", type_tag:true) = {
  import draw: *
  for i in range(m){
    for j in range(n){
      let x = loc.at(0) + i * size
      let y = loc.at(1) + j * size
      if (i != m - 1) and (j != n - 1) {
        // determine the color of the plaquette
        let (colora, colorb) = if (calc.rem(i + j, 2) == 0) {
          (color1, color2)
        } else {
          (color2, color1)
        }
        // four types of boundary plaquettes
        if type_tag == (calc.rem(i + j, 2) == 0) {
          if (i == 0) {
              bezier((x, y), (x, y + size), (x - size * 0.7, y + size/2), fill: colorb, stroke: black)
            }
            if (i == m - 2) {
              bezier((x + size, y), (x + size, y + size), (x + size * 1.7, y + size/2), fill: colorb, stroke: black)
            }
          } else {
            if (j == 0) {
              bezier((x, y), (x + size, y), (x + size/2, y - size * 0.7), fill: colorb, stroke: black)
            }
            if (j == n - 2) {
              bezier((x, y + size), (x + size, y + size), (x + size/2, y + size * 1.7), fill: colorb, stroke: black)
            }
          }
          rect((x, y), (x + size, y + size), fill: colora, stroke: black, name: name + "_square" + "_" + str(i) + "_" + str(j))
      }
      circle((x, y), radius: 0.08 * size, fill: black, stroke: none, name: name + "_" + str(i) + "_" + str(j))
    }
    }
  }
}

#let surface_code_label(loc, size:1, color1:yellow, color2:aqua) = {
  import draw: *
  let x = loc.at(0)
  let y = loc.at(1)
  content((x, y), box(stroke: black, inset: 10pt, [$X$ stabilizers],fill: color2, radius: 4pt))
  content((x, y - 1.5*size), box(stroke: black, inset: 10pt, [$Z$ stabilizers],fill: color1, radius: 4pt))
}

#let toric_code(loc, m, n, size:1, color1:yellow, color2:aqua, type_tag:true, line_thickness:1pt,name: "toric", open_boundary:true) = {
  import draw: *
  // let x_posx = 0
  // let y_posx = 0
  // let x_posz = 2
  // let y_posz = 1
  // rect((x_posx, y_posx), (x_posx + size, y_posx - size), fill: color2, stroke: black,name: "Xcheck")
  // content("Xcheck", [$X$])
  for i in range(m+1){
    for j in range(n+1){
      if ((open_boundary == false) or ((i < m) or (j < n))) {
      let x = loc.at(0) + i * size
      let y = loc.at(0) - j * size
      circle((x + size/2, y), radius: 0.2, fill: none, stroke: (thickness: line_thickness),name: name + "_point_vertical_" + str(i) +"_" + str(j))
      
      circle((x, y - size/2), radius: 0.2, fill: none, stroke: (thickness: line_thickness),name: name + "_point_horizontal_" + str(i) +"_" + str(j))
    }
  }
}
for i in range(m){
  for j in range(n){
    line(name + "_point_vertical_" + str(i) +"_" + str(j), (rel: (-size/2, 0), to: name + "_point_vertical_" + str(i) +"_" + str(j)),name + "_point_horizontal_" + str(i) +"_" + str(j),  stroke: (thickness: line_thickness))
      line(name + "_point_vertical_" + str(i) +"_" + str(j), (rel: (+size/2, 0), to: name + "_point_vertical_" + str(i) +"_" + str(j)),stroke: (thickness: line_thickness))
      line(name + "_point_horizontal_" + str(i) +"_" + str(j), (rel: (0, -size/2), to: name + "_point_horizontal_" + str(i) +"_" + str(j)),stroke: (thickness: line_thickness))}
      }
}
}