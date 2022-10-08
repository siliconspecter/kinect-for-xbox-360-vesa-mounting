include <measurements.scad>

cube([
    malm_height_mm + thickness_mm * 2,
    thickness_mm,
    malm_width_mm,
]);

translate([0, thickness_mm, 0]) {
    cube([
        thickness_mm,
        malm_length_mm,
        malm_width_mm,
    ]);
};

translate([malm_height_mm + thickness_mm, thickness_mm, 0]) {
    cube([
        thickness_mm,
        malm_length_mm,
        malm_width_mm,
    ]);
};

translate([malm_height_mm + thickness_mm * 2, thickness_mm + malm_length_mm / 2 - tube_retainer_diameter_mm / 2, 0]) {
    cube([
        tube_retainer_length_mm,
        tube_retainer_diameter_mm,
        (malm_width_mm - tube_feed_diameter_mm) / 2,
    ]);
};

translate([malm_height_mm + thickness_mm * 2, thickness_mm + malm_length_mm / 2, malm_width_mm / 2]) {
    rotate([0, 90, 0]) {
        difference() {
            cylinder(
                d1 = tube_retainer_diameter_mm + thickness_mm * 2 + tube_widening_mm * 2,
                d2 = tube_retainer_diameter_mm + thickness_mm * 2,
                h = tube_retainer_length_mm,
                $fn = tube_sides
            );

            cylinder(
                d = tube_retainer_diameter_mm,
                h = tube_retainer_length_mm,
                $fn = tube_sides
            );

            translate([0, 0, tube_retainer_length_mm - tube_feed_length_mm]) {
                cylinder(
                    d1 = tube_retainer_diameter_mm,
                    d2 = tube_feed_diameter_mm,
                    h = tube_feed_length_mm,
                    $fn = tube_sides
                );
            };
        };
    };
};
