#version  3.7;
global_settings { assumed_gamma 2.2 }

// Intended to be rendered at 4000 x 128 for a reddit header image

#include "shapes.inc"
#include "colors.inc"
#include "textures.inc"
#include "rand.inc"


// Main light source
light_source { <-50.0, 100, -80.0> colour White }

// Dim side light to fill shadows
light_source { <250.0, 25.0, -100.0> colour DimGray }


camera { // Wide Angle
   location <2, 1, -4.0>
   angle 170 
   right     x*image_width/image_height
   look_at <0, 0.5, 0>
}
background { color CadetBlue }

plane {
    y, 0 // perpendicular to axis, offset
    texture {
        pigment {
            checker Black, White
        }
    }
}

sphere {
    <0,0,0>, 1
    texture { pigment { color Yellow } }
}