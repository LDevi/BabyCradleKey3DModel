// Paramètres de la tige
$diameter_shaft = 10; // Diamètre de la tige
$length_shaft = 65; // Longueur de la tige

// Paramètres de la tête
$width_head = 30; // Largeur de la tête
$thickness_head = 10; // Épaisseur de la tête
$length_head = 10; // Longueur de la tête


// Paramètres du panneton
$width_ward = 13; // Largeur du panneton 
$length_ward = $width_ward/2; // Longueur du panneton
$thickness_ward = 10; // Épaisseur du panneton


// Création de la tige (cylindre)
cylinder(d=$diameter_shaft, h=$length_shaft, center=true);


// Création de la tête (rectangle)
intersection() {
translate([0, 0, -($length_shaft/2)])
    cube([ $width_head, $thickness_head, $length_head], center = true);
    
translate([0, 0, -($length_head/2+$length_shaft/2)])
    rotate([90,0,0])
        cylinder(d=$width_head, h=$thickness_ward, center=true);;
}    

    
    

// Création du panneton (rectangle)
translate([0,0,$length_shaft/2])
    rotate([0,90,0])
        cylinder(d=$length_ward, h=$width_ward, center=true);;
    
translate([$width_ward/2,0,$length_shaft/2])   
    sphere(d = $length_ward);
    
translate([-$width_ward/2,0,$length_shaft/2])   
    sphere(d = $length_ward);
