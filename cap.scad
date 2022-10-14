include <measurements.scad>

difference() {
    cylinder(
        d = tube_retainer_diameter_mm + thickness_mm * 2,
        h = thickness_mm + tube_retainer_length_mm,
        $fn = tube_sides
    );

    translate([0, 0, thickness_mm]) {
        cylinder(
            d = tube_retainer_diameter_mm,
            h = tube_retainer_length_mm,
            $fn = tube_sides
        );
    };

    translate([0, 0, thickness_mm + tube_retainer_length_mm - tube_feed_length_mm]) {
        cylinder(
            d1 = tube_retainer_diameter_mm,
            d2 = tube_feed_diameter_mm,
            h = tube_feed_length_mm,
            $fn = tube_sides
        );
    };
};
