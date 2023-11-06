view_camera[self.index] = camera_create();

self.display_aspect_ratio = display_get_width()/display_get_height();
self.aspect_ratio = self.use_display_aspect_ratio && os_browser == browser_not_a_browser ? self.display_aspect_ratio : self.custom_aspect_ratio;

self.__manual_x = 0;
self.__manual_y = 0;


if (self.adjust_width) {
	self.resolution_height = self.ideal_height;
	self.resolution_width = floor(self.resolution_height * self.aspect_ratio);
}
else if (self.adjust_height) {
	self.resolution_width = self.ideal_width;
	self.resolution_height = floor(self.resolution_width / self.aspect_ratio);
}
else {
	self.resolution_width = self.ideal_width;
	self.resolution_height = self.ideal_height;
}


if (self.resolution_width % 2 != 0)		self.resolution_width--;
if (self.resolution_height % 2 != 0)	self.resolution_height--;

self.move = function(_x = self.__manual_x, _y = self.__manual_y) {
	if (self.follow_target == noone || !instance_exists(self.follow_target)) {
		self.__manual_x = self.constraint_to_room ? clamp(_x, 0, room_width) : _x;
		self.__manual_y = self.constraint_to_room ? clamp(_y, 0, room_height) : _y;
	}	
}

self.get_position = function() {
	return {x: camera_get_view_x(view_camera[self.index]), y: camera_get_view_y(view_camera[self.index])};
}

window_set_size(self.resolution_width*self.window_scale, self.resolution_height*self.window_scale);
surface_resize(application_surface, self.resolution_width*self.window_scale, self.resolution_height*self.window_scale);
display_set_gui_size(self.resolution_width*self.gui_scale, self.resolution_height*self.gui_scale);
