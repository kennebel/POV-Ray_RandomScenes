#version  3.7;
global_settings { assumed_gamma 2.2 }

#include "shapes.inc"
#include "colors.inc"
#include "textures.inc"


// Main light source
light_source { <-50.0, 100, -80.0> colour White }

// Dim side light to fill shadows
light_source { <250.0, 25.0, -100.0> colour DimGray }


#declare CamScene = camera { // Wide Angle
   location <-40.0, 60.0, -40.0>
   angle 65 
   right     x*image_width/image_height
   look_at <0, 12, 0>
}
camera { CamScene }

background { color Blue }

plane {
   y, 0 // perpendicular to axis, offset
   texture {
      pigment { 
         color <0.184314, 0.7, 0.184314>
      }
   }
}

#declare ScrewHead = cone {
   <-1, 0, 0>, 1.0 
   <0, 0, 0>, 0.25
   texture { pigment { color Blue } }
}

#declare Upright = box {
   <-2, 0, -2>, <2, 24, 2>
   texture { pigment { color Yellow } }
}
#declare Uprights = union {
   object {
      Upright
      translate <22, 0, 10>
   }
   object {
      Upright
      translate <-22, 0, 10>
   }
   object {
      Upright
      translate <22, 0, -10>
   }
   object {
      Upright
      translate <-22, 0, -10>
   }
}

#declare ShortBoard = union {
   box {
      <-1, -3, -12>, <1, 3, 12>
      texture { pigment { color Brown*0.9 } }
   }
   object {
      ScrewHead
      translate <-0.5, 1, -11>
   }
   object {
      ScrewHead
      translate <-0.5, -1, -9>
   }
   object {
      ScrewHead
      translate <-0.5, 1, 9>
   }
   object {
      ScrewHead
      translate <-0.5, -1, 11>
   }
}
#declare ShortBoards = union {
   object {
      ShortBoard
      translate <-25, 24, 0>
   }
   object {
      ShortBoard
      translate <-25, 17, 0>
   }
   object {
      ShortBoard
      translate <-25, 10, 0>
   }
   object {
      ShortBoard
      rotate <0, 180, 0>
      translate <25, 24, 0>
   }
   object {
      ShortBoard
      rotate <0, 180, 0>
      translate <25, 17, 0>
   }
   object {
      ShortBoard
      rotate <0, 180, 0>
      translate <25, 10, 0>
   }}

#declare LongBoard = union {
   box {
      <-24, -3, -1>, <24, 3, 1>
      texture { pigment { color Brown*0.9 } }
   }
   object {
      ScrewHead
      rotate <0, -90, 0>
      translate <-21, 1, -0.5>
   }
   object {
      ScrewHead
      rotate <0, -90, 0>
      translate <-23, -1, -0.5>
   }
   object {
      ScrewHead
      rotate <0, -90, 0>
      translate <23, 1, -0.5>
   }
   object {
      ScrewHead
      rotate <0, -90, 0>
      translate <21, -1, -0.5>
   }
}
#declare LongBoards = union {
   object {
      LongBoard
      translate <0, 24, -13>
   }
   object {
      LongBoard
      translate <0, 17, -13>
   }
   object {
      LongBoard
      translate <0, 10, -13>
   }
   object {
      LongBoard
      rotate <0, 180, 0>
      translate <0, 24, 13>
   }
   object {
      LongBoard
      rotate <0, 180, 0>
      translate <0, 17, 13>
   }
   object {
      LongBoard
      rotate <0, 180, 0>
      translate <0, 10, 13>
   }
}
#declare BasicFrame = union {
   object { Uprights }
   object { ShortBoards }
   object { LongBoards }
}
object { BasicFrame }

#declare Support = box {
   <-20, -0.5, -0.5>, <20, 0.5, 0.5>
   texture { pigment { color Yellow } }
}
#declare Supports = union {
   object {
      Support
      translate <0, 9, 12>
   }
   object {
      Support
      translate <0, 9, -12>
   }
}
object { Supports }

#declare Slat = box {
   <-3, -0.5, -11.5>, <3, 0.5, 11.5>
   texture { pigment { color Brown } }
}
#declare Slats = union {
   object {
      Slat
      translate <0, 10, 0>
   }
   object {
      Slat
      translate <-7, 10, 0>
   }
   object {
      Slat
      translate <7, 10, 0>
   }
   object {
      Slat
      translate <-14, 10, 0>
   }
   object {
      Slat
      translate <14, 10, 0>
   }
   //object {
   //   Slat
   //   translate <0, 10, 0>
   //}
}
object { Slats }