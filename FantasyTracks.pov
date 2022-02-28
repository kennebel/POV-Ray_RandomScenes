#version  3.7;
global_settings { assumed_gamma 2.2 }

#include "shapes.inc"
#include "colors.inc"
#include "textures.inc"
#include "rand.inc"


// Main light source
light_source { <-50.0, 100, -80.0> colour White }

// Dim side light to fill shadows
light_source { <250.0, 25.0, -100.0> colour DimGray }


camera { // Wide Angle
   location <6.0, 5.0, -13.0>
   angle 65 
   right     x*image_width/image_height
   look_at <0, 0, 0>
}
background { color LightGrey }