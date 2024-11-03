// Advanced fluids coursework Cylinder sglallpr

// Parameters 

// Geometry 
RI = 0.001; // Inner Cylinder Radius (m)
RO = 0.002; // Outer Cylinder Radius (m)
RAL = 0.01; // Recommended Axial Length (m)

// Mesh
MSP = 5e-5; // mesh size at point
//MA = 50; // Mesh at circle arcs
//ML = 75; // Mesh at lines
//DC = 0.01; // mesh density at inner and outer 



// Points
Point(1) = {0, 0, 0, MSP}; // Centre 

Point(2) = {0, RI, 0, MSP}; // Inner
Point(3) = {0, -RI, 0, MSP}; // Inner 
Point(4) = {RI, 0, 0, MSP}; // Inner
Point(5) = {-RI, 0, 0, MSP}; // Inner 

Point(6) = {0, RO, 0, MSP}; // Outer
Point(7) = {0, -RO, 0, MSP}; // Outer 
Point(8) = {RO, 0, 0, MSP}; // Outer
Point(9) = {-RO, 0, 0, MSP}; // Outer 

// Cylinder Lines
Circle(1) = {5, 1, 2}; // Inner
Circle(2) = {2, 1, 4};
Circle(3) = {4, 1, 3};
Circle(4) = {3, 1, 5};

Circle(5) = {6, 1, 8}; // Outer
Circle(6) = {8, 1, 7};
Circle(7) = {7, 1, 9};
Circle(8) = {9, 1, 6};

Line(9) = {6, 2};
Line(10) = {8, 4};
Line(11) = {3, 7};
Line(12) = {9, 5};

/* //Structured mesh
Transfinite Curve {8, 1, 5, 2, 3, 6, 7, 4} = ML Using Bump 1; // arc
Transfinite Curve {9, 10, 11, 12} = MA Using Bump DC; // lines


Curve Loop(1) = {8, 9, -1, -12};
Plane Surface(1) = {1};
Curve Loop(2) = {5, 10, -2, -9};
Plane Surface(2) = {2};
Curve Loop(3) = {3, 11, -6, 10};
Plane Surface(3) = {3};
Curve Loop(4) = {12, -4, 11, 7};
Plane Surface(4) = {4};

Transfinite Surface {1};
Transfinite Surface {2};
Transfinite Surface {3};
Transfinite Surface {4};
Recombine Surface {1, 2, 3, 4};

// Extrude
Extrude {0, 0, -RAL} {
  Surface{1}; Surface{2}; Surface{3}; Surface{4}; Layers {5}; Recombine;
}

// Boundary conditions - Su2 inputs
Physical Surface("inlet", 101) = {2, 1, 3, 4};
Physical Surface("outlet", 102) = {56, 34, 100, 78};
Physical Surface("innerWall", 103) = {29, 91, 65, 51};
Physical Surface("outerWall", 104) = {21, 99, 73, 43};

Physical Volume("fluid", 105) = {3, 4, 2, 1};

*/

// unstructured mesh
Curve Loop(1) = {8, 9, -1, -12};
Plane Surface(1) = {1};
Curve Loop(2) = {5, 10, -2, -9};
Plane Surface(2) = {2};
Curve Loop(3) = {3, 11, -6, 10};
Plane Surface(3) = {3};
Curve Loop(4) = {12, -4, 11, 7};
Plane Surface(4) = {4};

// Extrude
Extrude {0, 0, -RAL} {
  Surface{1}; Surface{2}; Surface{3}; Surface{4}; Layers {30}; Recombine;
}