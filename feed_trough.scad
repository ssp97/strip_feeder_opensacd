
module feed_trough_A(slot_height=20, slot_length=100, slot_depth=20) {
    translate([0, 0, 14+22+slot_height+slot_depth+20])
    rotate([90,180,180])
    linear_extrude(height=slot_length)
    polygon(points=[
        [-6, 0],
        [14, 0],
        [14, 6],
        [6, 14],
        [6, 14+slot_height],
        [14, 14+slot_height],
        [14, 14+slot_height+2+slot_depth+10],
        [-6, 14+slot_height+2+slot_depth+10]
    ]);
}

module feed_though_B(slot_height=20, slot_length=100, slot_width=80, slot_depth=20) {
    translate([12+slot_width, 0, 14+22+slot_height+slot_depth+20])
    rotate([90,180,180])
    linear_extrude(height=slot_length)
    polygon(points=[
        [6, 0],
        [-14, 0],
        [-14, 6],
        [-6, 14],
        [-6, 14+slot_height],
        [-6-32, 14+slot_height],
        [-6-32, 14+slot_height+2+slot_depth+10],
        [6, 14+slot_height+2+slot_depth+10]
    ]); 
}

module feed_though_C(slot_length = 100, slot_width = 80)
{
    translate([0, 0, 30])
    rotate([90,180,180])
    linear_extrude(height=slot_length)
    polygon(points=[
        [-6, 0],
        [-6, 30],
        [12+slot_width+6, 30],
        [12+slot_width+6, 0]
    ]); 
}

module feed_trough(slot_height=10, slot_length=100, slot_width=80, slot_depth=20){
    feed_trough_A(slot_height, slot_length, slot_depth);
    feed_though_B(slot_height, slot_length, slot_width, slot_depth);
    feed_though_C(slot_length, slot_width);
}

module feed_trouugh_array_corner(slot_length=100, offset=0, is_mirror=0){
    xOffset = (is_mirror != 0) ? -6 : slot_length+6;
    yOffset = (is_mirror != 0) ? offset+(10+36+42) : -(10+36+42);
    zRotate = (is_mirror != 0) ? 90:270;
    
    translate([xOffset, yOffset, 66])
    rotate([90,180,zRotate])
    linear_extrude(height=slot_length+12)
    polygon(points=[
        [0, 0],
        [10, 0],
        [10+36, 36],
        [10+36+42, 36],
        [10+36+42, 66],
        [0, 66],
        [0, 0]
    ]); 
}


module feed_trough_array(num = 5, slot_height=10, slot_length=100, slot_width=80, slot_depth=20){
    for (i = [0 : num-1]) {
        translate([i * (slot_width + 12), 0, 0])
            feed_trough(slot_height, slot_length, slot_width, slot_depth);
    }
    //feed_trouugh_array_corner(num * (slot_width + 12), slot_length, 0);
    //feed_trouugh_array_corner(num * (slot_width + 12), slot_length, 1);
}

//scale(0.1)
feed_trough_array(7, 10, 3000, 120, 20);
    
