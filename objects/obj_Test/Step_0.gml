self.x += 3*(keyboard_check(vk_right) - keyboard_check(vk_left));
self.y += 3*(keyboard_check(vk_down) - keyboard_check(vk_up));

var _x = Camera.get_position().x + 3*(keyboard_check(ord("D")) - keyboard_check(ord("A")));
var _y = Camera.get_position().y + 3*(keyboard_check(ord("S")) - keyboard_check(ord("W")));
show_debug_message($"Moving from {Camera.get_position().x} {Camera.get_position().y} to {_x}, {_y}");
Camera.move(_x, _y);

if (keyboard_check_pressed(vk_space)) {
	if (Camera.follow_target == noone) 			Camera.follow_target = self;
	else 										Camera.follow_target = noone;
}
if (mouse_wheel_up())	Camera.move_smoothness = clamp(Camera.move_smoothness+0.1, 0, 10);
if (mouse_wheel_down())	Camera.move_smoothness = clamp(Camera.move_smoothness-0.1, 0, 10);

if (keyboard_check_pressed(ord("1")))	Camera.offset_x -= 10;
if (keyboard_check_pressed(ord("2")))	Camera.offset_x += 10;