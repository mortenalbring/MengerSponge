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

#macro voidCubes(dim) 
   
    #declare y1 = (1/3)/(pow(3,dim));
    #declare z1 = (1/3)/(pow(3,dim));
    
    #declare prod1 = -0.1;
    #declare prod2 = 1.1;
    
    #declare psize = (1/3)/(pow(3,dim));
                    
    #while (z1<=1)
            #declare y1 = (1/3)/(pow(3,dim));
            #while (y1<=1)
                    box { <prod1,y1,z1> <prod2,y1+psize,z1+psize> pigment { color rgb <1,0.2,0> } } 
                    box { <y1,z1,prod1> <y1+psize,z1+psize,prod2> pigment { color rgb <1,0.2,0> } } 
                    box { <y1,prod1,z1> <y1+psize,prod2,z1+psize> pigment { color rgb <1,0.2,0> } }  
                    
                    #if (dim < 2 )
                    light_source { <(prod1+prod2)/2,y1,z1> color rgb <1,1,1> }                
                    #end                                               
                                             
                    #declare y1=y1+pow((1/3),dim);
            #end
            #declare z1=z1+pow((1/3),dim);
       #end             
#end   


#declare menger = 
    difference {
            box {  <0, 0, 0>    <1,1,1>  }
            voidCubes(0)
            voidCubes(1)
            voidCubes(2)               
}

object { menger scale 300 
          
 pigment { color rgb <1,0.2,0>  }
     finish {
        ambient .5
        diffuse .1
        specular 1
        roughness .001
        reflection {
          .75
          metallic
        }
     }
}
