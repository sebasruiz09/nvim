return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup {
			fps = 60,
			render = "default",
			stages = "fade_in_slide_out",
			timeout = 2500,
		}
	end
}
