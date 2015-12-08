var xPos = argument0;
var yPos = argument1;
var radius = argument2;
var divisions = argument3 * 2;
var rotation = argument4;
var color = argument5;

var iterations = 32;
var precision = 2*pi/iterations;

draw_set_color(color);

// Draw the gear
draw_primitive_begin(pr_trianglestrip);
var count = 0;
var swap = false;
for (var i = rotation; i < rotation + 2*pi + precision; i+= precision) {
    count ++;
    var ex = 0;
    if (count == floor(iterations/divisions)) {swap = !swap; count = 0;}
    if (swap) {ex = .33;}
    draw_vertex(xPos + radius * sin(i) * (0.67+ex), yPos - radius * cos(i) * (0.67+ex));
    draw_vertex(xPos + radius * sin(i) * 0.33, yPos - radius * cos(i) * 0.33);
}
draw_primitive_end();
draw_set_color(c_white);
