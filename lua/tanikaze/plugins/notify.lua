return {
	"rcarriga/nvim-notify",
	name = "notify",
	opts = {
		background_colour = "NotifyBackground",
		fps = 30,
		level = 2,
		minimum_width = 50,
		render = "default",
		stages = "fade_in_slide_out",
		time_formats = { notification = "%T", notification_history = "%FT%T" },
		timeout = 100,
		top_down = true
	}
}
