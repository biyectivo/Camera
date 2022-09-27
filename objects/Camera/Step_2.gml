if (instance_exists(self.camera_target)) {
	
	// Calculate size
	var _target_w = self.resolution_width*self.view_zoom;
	var _target_h = self.resolution_height*self.view_zoom;	
	if (self.camera_zoom_smoothness > 0) {
		var _cam_w = lerp(camera_get_view_width(CAMERA), _target_w, self.camera_zoom_smoothness);
		var _cam_h = lerp(camera_get_view_height(CAMERA), _target_h, self.camera_zoom_smoothness);
		
		if (abs(_cam_w-_target_w)<2*self.camera_zoom_smoothness)	_cam_w = _target_w;
		if (abs(_cam_h-_target_h)<2*self.camera_zoom_smoothness)	_cam_h = _target_h;
	}
	else {
		var _cam_w = _target_w;
		var _cam_h = _target_h;
	}
	
	// Calculate position
	var _target_x = floor(self.camera_target.x - self.resolution_width*self.view_zoom/2);
	var _target_y = floor(self.camera_target.y - self.resolution_height*self.view_zoom/2);
	if (self.camera_move_smoothness > 0) {		
		var _cam_x = clamp(lerp(camera_get_view_x(CAMERA), _target_x, self.camera_move_smoothness), 0, room_width-self.resolution_width*self.view_zoom);
		var _cam_y = clamp(lerp(camera_get_view_y(CAMERA), _target_y, self.camera_move_smoothness), 0, room_height-self.resolution_height*self.view_zoom);
		
		if (abs(_cam_x - _target_x) < 2 * self.camera_move_smoothness)	_cam_x = _target_x;
		if (abs(_cam_y - _target_y) < 2 * self.camera_move_smoothness)	_cam_y = _target_y;
	}
	else {
		var _cam_x = clamp(_target_x, 0, room_width-self.resolution_width*self.view_zoom);
		var _cam_y = clamp(_target_y, 0, room_height-self.resolution_height*self.view_zoom);
	}
	
	camera_set_view_size(CAMERA, _cam_w, _cam_h);
	camera_set_view_pos(CAMERA, _cam_x, _cam_y);

}

display_set_gui_size(self.resolution_width*self.gui_scale, self.resolution_height*self.gui_scale);
	