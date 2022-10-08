include <measurements.scad>

difference() {
    cylinder(
        d = tube_retainer_diameter_mm + thickness_mm * 2,
        h = tube_retainer_length_mm * 2 + thickness_mm,
        $fn = tube_sides
    );

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

    translate([0, 0, tube_retainer_length_mm + thickness_mm]) {
        cylinder(
            d = tube_retainer_diameter_mm,
            h = tube_retainer_length_mm,
            $fn = tube_sides
        );
    };

    translate([0, 0, tube_retainer_length_mm * 2 + thickness_mm - tube_feed_length_mm]) {
        cylinder(
            d1 = tube_retainer_diameter_mm,
            d2 = tube_feed_diameter_mm,
            h = tube_feed_length_mm,
            $fn = tube_sides
        );
    };
};
