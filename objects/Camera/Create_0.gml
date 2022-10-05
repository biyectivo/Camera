self.display_aspect_ratio = display_get_width()/display_get_height();
self.aspect_ratio = self.use_display_aspect_ratio && os_browser == browser_not_a_browser ? self.display_aspect_ratio : self.custom_aspect_ratio;

#macro	CAMERA	view_camera[0]
#macro	CAM_X	camera_get_view_x(CAMERA)
#macro	CAM_Y	camera_get_view_y(CAMERA)
#macro	CAM_W	camera_get_view_width(CAMERA)
#macro	CAM_H	camera_get_view_height(CAMERA)
#macro	GUI_W	display_get_gui_width()
#macro	GUI_H	display_get_gui_height()

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

window_set_size(self.resolution_width*self.window_scale, self.resolution_height*self.window_scale);
surface_resize(application_surface, self.resolution_width*self.window_scale, self.resolution_height*self.window_scale);
display_set_gui_size(self.resolution_width*self.gui_scale, self.resolution_height*self.gui_scale);
