camera {
        location  <150, 255, -600>         
        look_at   <150, 150, 200>
}

plane { y, 0
		pigment { checker rgb <0.1, 0.1, 0.1> rgb <1.0, 1.0, 1.0> scale 15 }
		finish { reflection 0.1 ambient 0.4 }      		
}

sky_sphere {
  pigment {
    gradient y
    color_map {
      [0.0 rgb <0.6,0.7,1.0>]
      [0.7 rgb <0.0,0.1,0.8>]
    }
  }
}

fog {
  fog_type   2
  distance   10
  color      rgb 0.6
  fog_offset 0.1
  fog_alt    0.2
  turbulence 0.8
}