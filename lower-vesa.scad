include <measurements.scad>;

width_mm = max(vesa_screw_head_diameter_mm, tube_retainer_diameter_mm) + thickness_mm * 2;

difference() {
  union() {
    translate([
      width_mm / -2,
      vesa_screw_head_diameter_mm / -2 - thickness_mm,
      0,
    ]) {
      cube([
        width_mm,
        thickness_mm + tube_retainer_length_mm,
        thickness_mm + vesa_screw_height_height_mm + tube_retainer_diameter_mm / 2,
      ]);
    };

    translate([
      0,
      vesa_screw_head_diameter_mm / -2 - thickness_mm,
      thickness_mm + vesa_screw_height_height_mm + tube_retainer_diameter_mm / 2,
    ]) {
      rotate([-90, 0, 0]) {
        cylinder(
          d = tube_retainer_diameter_mm + thickness_mm * 2,
          h = thickness_mm + tube_retainer_length_mm,
          $fn = tube_sides
        );
      };
    };
  };

  translate([
    0,
    vesa_screw_head_diameter_mm / -2,
    thickness_mm + vesa_screw_height_height_mm + tube_retainer_diameter_mm / 2,
  ]) {
    rotate([-90, 0, 0]) {
      cylinder(
        d = tube_retainer_diameter_mm,
        h = tube_retainer_length_mm,
        $fn = tube_sides
      );
    };
  };

  translate([
    0,
    vesa_screw_head_diameter_mm / -2 + tube_retainer_length_mm - tube_feed_length_mm,
    thickness_mm + vesa_screw_height_height_mm + tube_retainer_diameter_mm / 2,
  ]) {
    rotate([-90, 0, 0]) {
      cylinder(
        d1 = tube_retainer_diameter_mm,
        d2 = tube_feed_diameter_mm,
        h = tube_feed_length_mm,
        $fn = tube_sides
      );
    };
  };

  cylinder(
    d = vesa_screw_hole_diameter_mm,
    h = thickness_mm,
    $fn = vesa_screw_sides
  );

  translate([0, 0, thickness_mm]) {
    cylinder(
      d = vesa_screw_head_diameter_mm,
      h = vesa_screw_height_height_mm + tube_retainer_diameter_mm + thickness_mm,
      $fn = vesa_screw_sides
    );
  };
};
