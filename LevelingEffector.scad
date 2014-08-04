//Modified code from Johann C. Rocholl's Mini Kossel Effector for 
//probeless autoleveling.

separation = 40;  // Distance between ball joint mounting faces.
offset = 20;  // Same as DELTA_EFFECTOR_OFFSET in Marlin.
mount_radius = 12.5;  // Hotend mounting screws, standard would be 25mm.
hotend_radius = 10;  // Hole for the hotend (J-Head diameter is 16mm).
push_fit_radius = 10;  // Brass fitting for bowden tube.
push_fit_height = 5;  // Length of brass threaded into printed plastic.
height = 8;
cone_r1 = 2.5;
cone_r2 = 14;

rotate([0,0,60]) translate ([0,0,-5])

difference() {
  union() {
    cylinder(r=offset-2, h=height, center=true, $fn=36);
    for (a = [60:120:359]) rotate([0, 0, a]) {
      rotate([0, 0, 30]) translate([offset-2, 0, 0])
        cube([10, 13, height], center=true);
      for (s = [-1, 1]) scale([s, 1, 1]) {
        translate([0, offset, 0]) difference() {
          intersection() {
            cube([separation, 40, height], center=true);
            translate([0, -4, 0]) rotate([0, 90, 0])
              cylinder(r=10, h=separation, center=true);
            translate([separation/2-7, 0, 0]) rotate([0, 90, 0])
              cylinder(r1=cone_r2, r2=cone_r1, h=14, center=true, $fn=24);
          }
        rotate([0, 90, 0])
          cylinder(r=m3_radius, h=separation+1, center=true, $fn=12);
        rotate([90, 0, 90])
          cylinder(r=m3_nut_radius, h=separation-24, center=true, $fn=6);

        }
      }
    }
  }
translate([0, 0, push_fit_height-height/2])
 cylinder(r=hotend_radius, h=height, $fn=36);
cylinder(r=push_fit_radius, h=height+1, center=true);
  for (a = [10:120:359]) rotate([0, 0, a]) {
    translate([0, mount_radius, 0])
     cylinder(r=m3_wide_radius, h=2*height, center=true, $fn=12);
}
 for (a = [-10:120:359]) rotate([0, 0, a]) {
    translate([0, mount_radius, 0])
     cylinder(r=m3_wide_radius, h=2*height, center=true, $fn=12);
 }

 for (a = [0:120:359]) rotate([0, 0, a]) {
    translate([0, 20, 0])
     cylinder(r=m3_wide_radius, h=2*height, center=true, $fn=12);

 }
 for (a = [60:120:359]) rotate([0, 0, a]) {
    translate([0, 11.5, -2.5])
     cylinder(r=2, h=12, $fn=12);

 }


}



