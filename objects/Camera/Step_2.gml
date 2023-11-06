// Calculate size
var _target_w = self.resolution_width*self.view_zoom;
var _target_h = self.resolution_height*self.view_zoom;	
if (self.zoom_smoothness > 0) {
	var _cam_w = lerp(camera_get_view_width(view_camera[self.index]), _target_w, self.zoom_smoothness);
	var _cam_h = lerp(camera_get_view_height(view_camera[self.index]), _target_h, self.zoom_smoothness);
		
	if (abs(_cam_w-_target_w)<2*self.zoom_smoothness)	_cam_w = _target_w;
	if (abs(_cam_h-_target_h)<2*self.zoom_smoothness)	_cam_h = _target_h;
}
else {
	var _cam_w = _target_w;
	var _cam_h = _target_h;
}
camera_set_view_size(view_camera[self.index], _cam_w, _cam_h);

// Calculate position
if (self.follow_target != noone && instance_exists(self.follow_target)) {
	var _target_x = floor(self.follow_target.x - self.resolution_width*self.view_zoom/2 + self.offset_x);
	var _target_y = floor(self.follow_target.y - self.resolution_height*self.view_zoom/2 + self.offset_y);
}
else {
	_target_x = self.__manual_x;
	_target_y = self.__manual_y;
}

var _min_value_x = self.constraint_to_room ? 0 : -9999999999;
var _max_value_x = self.constraint_to_room ? room_width-self.resolution_width*self.view_zoom : 9999999999;
var _min_value_y = self.constraint_to_room ? 0 : -9999999999;
var _max_value_y = self.constraint_to_room ? room_height-self.resolution_height*self.view_zoom : 9999999999;

if (self.move_smoothness > 0) {
	var _cam_x = clamp(lerp(camera_get_view_x(view_camera[self.index]), _target_x, self.move_smoothness), _min_value_x, _max_value_x);
	var _cam_y = clamp(lerp(camera_get_view_y(view_camera[self.index]), _target_y, self.move_smoothness), _min_value_y, _max_value_y);
		
	if (abs(_cam_x - _target_x) < 2 * self.move_smoothness)	_cam_x = _target_x;
	if (abs(_cam_y - _target_y) < 2 * self.move_smoothness)	_cam_y = _target_y;
}
else {
	var _cam_x = clamp(_target_x,  _min_value_x, _max_value_x);
	var _cam_y = clamp(_target_y,  _min_value_y, _max_value_y);
}

camera_set_view_pos(view_camera[self.index], _cam_x, _cam_y);
self.__manual_x = _cam_x;
self.__manual_y = _cam_y;

display_set_gui_size(self.resolution_width*self.gui_scale, self.resolution_height*self.gui_scale);
	