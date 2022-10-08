include <measurements.scad>

difference() {
    union() {
        translate([0, kinect_length_mm / 2, tube_retainer_length_mm]) {
            rotate([90, 0, 0]) {
                linear_extrude(kinect_length_mm) {
                    polygon([
                        [kinect_lower_width_mm / 2, kinect_base_height_mm],
                        [kinect_middle_width_mm / 2, kinect_base_height_mm + kinect_lower_height_mm],
                        [kinect_top_width_mm / 2, kinect_base_height_mm + kinect_lower_height_mm + kinect_upper_height_mm],
                        [kinect_top_width_mm / 2 + kinect_clip_thickness_mm, kinect_base_height_mm + kinect_lower_height_mm + kinect_upper_height_mm],
                        [kinect_middle_width_mm / 2 + kinect_clip_thickness_mm, kinect_base_height_mm + kinect_lower_height_mm],
                        [kinect_lower_width_mm / 2 + kinect_clip_thickness_mm, kinect_base_height_mm],
                        [kinect_lower_width_mm / 2 + kinect_clip_thickness_mm, 0],
                        [kinect_lower_width_mm / -2 - kinect_clip_thickness_mm, 0],
                        [kinect_lower_width_mm / -2 - kinect_clip_thickness_mm, kinect_base_height_mm],
                        [kinect_middle_width_mm / -2 - kinect_clip_thickness_mm, kinect_base_height_mm + kinect_lower_height_mm],
                        [kinect_top_width_mm / -2 - kinect_clip_thickness_mm, kinect_base_height_mm + kinect_lower_height_mm + kinect_upper_height_mm],
                        [kinect_top_width_mm / -2, kinect_base_height_mm + kinect_lower_height_mm + kinect_upper_height_mm],
                        [kinect_middle_width_mm / -2, kinect_base_height_mm + kinect_lower_height_mm],
                        [kinect_lower_width_mm / -2, kinect_base_height_mm],
                    ]);
                };
            };
        };

        hull() {
            cylinder(
                d = tube_retainer_diameter_mm + thickness_mm * 2,
                h = tube_retainer_length_mm,
                $fn = tube_sides
            );

            translate([
                kinect_lower_width_mm / -2 - kinect_clip_thickness_mm,
                kinect_length_mm / -2,
                tube_retainer_length_mm,
            ]) {
                cube([
                    kinect_lower_width_mm + kinect_clip_thickness_mm * 2,
                    kinect_length_mm,
                    kinect_clip_thickness_mm,
                ]);
            };
        };
    };

    translate([kinect_screw_x_spacing_mm / 2, kinect_screw_y_spacing_mm / 2, 0]) {
        screw_hole();
    };

    translate([kinect_screw_x_spacing_mm / -2, kinect_screw_y_spacing_mm / 2, 0]) {
        screw_hole();
    };

    translate([kinect_screw_x_spacing_mm / 2, kinect_screw_y_spacing_mm / -2, 0]) {
        screw_hole();
    };

    translate([kinect_screw_x_spacing_mm / -2, kinect_screw_y_spacing_mm / -2, 0]) {
        screw_hole();
    };

    cylinder(
        d = tube_retainer_diameter_mm,
        h = tube_retainer_length_mm,
        $fn = tube_sides
    );

    cylinder(
        d1 = tube_feed_diameter_mm,
        d2 = tube_retainer_diameter_mm,
        h = tube_feed_length_mm,
        $fn = tube_sides
    );
};

module screw_hole() {
    cylinder(d = kinect_screw_head_diameter_mm, $fn = kinect_screw_sides, h = tube_retainer_length_mm - kinect_screw_hole_bridge_height_mm * 2);

    translate([
      0,
      0,
      tube_retainer_length_mm - kinect_screw_hole_bridge_height_mm * 2,
    ]) {
        linear_extrude(kinect_screw_hole_bridge_height_mm) {
            intersection() {
                circle(d = kinect_screw_head_diameter_mm, $fn = kinect_screw_sides);
                square([kinect_screw_head_diameter_mm, kinect_screw_hole_diameter_mm], center = true);
            };
        };
    };

    translate([
      0,
      0,
      tube_retainer_length_mm - kinect_screw_hole_bridge_height_mm,
    ]) {
        linear_extrude(kinect_screw_hole_bridge_height_mm) {
          square([kinect_screw_hole_diameter_mm, kinect_screw_hole_diameter_mm], center = true);
        };
    };

    cylinder(d = kinect_screw_hole_diameter_mm, $fn = kinect_screw_sides, h = tube_retainer_length_mm + kinect_clip_thickness_mm);
};
