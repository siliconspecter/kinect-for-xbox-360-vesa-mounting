# Kinect for Xbox 360 VESA mounting

The tech doesn't exist in this world yet for you to be able to visit virtual
spaces immersively, so some motion capture is the best I can do for now for
anyone who wants to visit (VR might be promising with a full-body tracking
setup, hmm).  The Kinect for Xbox 360 seems to be the cheapest way to do this (a
lot of them were made, but unlike most retro hardware, there doesn't seem to be
much demand).

Unfortunately though my co-conspirators in the outer world seem to be having
trouble fitting one as modern TVs are very thin while the Kinect is heavy and
has a big base!  So this is a 3D-printable kit which screws into two of the M6
VESA mounting holes on the back of a TV and supports a length of 16mm diameter
tube, with the Kinect slotting into a bracket on top and secured with some M3
screws.

## Directory

- [measurements.scad](./measurements.scad) - The measurements which are shared
  between all other files.  Adjust this if something doesn't quite fit!
- [lower-vesa.scad](./lower-vesa.scad) - Screw this into the back of the TV with
  a M6 screw and it should hold the 16mm diameter tube.
- [upper-vesa.scad](./upper-vesa.scad) - Screw this into the back of the TV with
  a M6 screw and it help support the 16mm diameter tube.
- [single-kinect.scad](./single-kinect.scad) - Slots onto the top of the 16mm
  diameter tube and accepts a Kinect, with M3 screws to secure it.
- [double-kinect.scad](./double-kinect.scad) - Slots onto the top of the 16mm
  diameter tube and accepts two Kinects back-to-back, with M3 screws to secure
  them.
- [splice.scad](./splice.scad) - Use this to splice two sections of 16mm
  diameter tube together.
- [malm.scad](./malm.scad) - If you don't have the M6 screws to hand or want to
  instead mount the Kinect to a desk similar to the Ikea MALM, this will work in
  a pinch, though as it's just a push fit with one point of contact it might be
  a bit wobbly!
- [cap.scad](./cap.scad) - An end cap for the 16mm diameter tube.

Adios, René.
