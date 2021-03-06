#version  3.7;
global_settings { assumed_gamma 2.2 }

// https://www.reddit.com/r/MobileWallpaper/comments/tpmp8v/day_64_wallpaper_1/

#include "shapes.inc"
#include "colors.inc"
#include "textures.inc"
//#include "rand.inc"
#include "stars.inc"
#include "metals.inc"


// Main light source
light_source { <-50.0, 100, -80.0> colour White }

// Dim side light to fill shadows
light_source { <250.0, 25.0, -100.0> colour DimGray }


#declare Cam1 = camera { // Wide Angle
   location <6.0, 5.0, -13.0>
   angle 65 
   right     x*image_width/image_height
   look_at <0, 0, 0>
}
#declare Cam2 = camera { // Wide Angle
   location <-1.0, 2.0, -2.0>
   right     x*image_width/image_height
   look_at <-1, 0, -2>
}
camera { Cam1 }
//sky_sphere {
//    pigment { White_Marble}
//    scale <0.5, 0.5, 0.5>
//}
sky_sphere {
    pigment {
        granite
        color_map {
            [ 0.000  0.270 color rgb < 0, 0, 0> color rgb < 0, 0, 0> ]
            [ 0.270  0.280 color rgb <.5,.5,.4> color rgb <.8,.8,.4> ]
            [ 0.280  0.470 color rgb < 0, 0, 0> color rgb < 0, 0, 0> ]
            [ 0.470  0.480 color rgb <.4,.4,.5> color rgb <.4,.4,.8> ]
            [ 0.480  0.680 color rgb < 0, 0, 0> color rgb < 0, 0, 0> ]
            [ 0.680  0.690 color rgb <.5,.4,.4> color rgb <.8,.4,.4> ]
            [ 0.690  0.880 color rgb < 0, 0, 0> color rgb < 0, 0, 0> ]
            [ 0.880  0.890 color rgb <.5,.5,.5> color rgb < 1, 1, 1> ]
            [ 0.890  1.000 color rgb < 0, 0, 0> color rgb < 0, 0, 0> ]
        }
    turbulence 1
    sine_wave
    scale 0.15
    }
}

