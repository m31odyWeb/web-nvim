local custom_header = {
	"                                                                                                   ",
	"                                                                                                   ",
	"               .!!:  .!!:  .!!^  ~!!!!!!^ :!!!!!^.  ^!!    ^!~ :!!.   :!77!::~77!:                 ",
	"              :GB!  :GB7  .GB? .PBP55557 !BG55PGP~ ~BB~  .PB? 7BG:  ?GGY5GGGG5YGGJ.                ",
	"              :GG!  :PB7  .PB? .PB?      !GG^  ?BP. 5BJ  !GG: !BG: ~BG~  ~GG!  ~GB~                ",
	"              :GG!  :PB7  .PB? .PB?      !GG:  ?BP. !BG: YBY  !BG: ~GG^  ^GG~  :GG!                ",
	"              :GG!  :PB7  .PB? .PGP555!  !GG5Y5GG!  .PB7^GG~  !BG: ~GG^  ^GG~  ^GG~                ",
	"              :GG!  :PB7  .PB? .PG5!77^  !GG?7?PG?   ?B5JB5.  !BG: ~GG^  ^GG~  ^GG~                ",
	"              :GG!  .PB7  .PB? .PB?      !GG:  7BG:  ^GGGG7   !BG: ~GG^  ^GG~  ^GG~                ",
	"              .PBJ:.!GBY:.!GB! .PBJ::::. !BG~:^YB5.   YGGP:   !BG: ~GG^  ^GG~  ^GB!                ",
	"               ^YPGPG5YPGPG5!  .5GPPPPG? ~GPPPPP?:    ~GGJ    !GP: ~GG^  ^GG~  ^PG~                ",
	"                 .:::  .:::     .::::::. .::::.        ::.    .::  .::    ::.   ::.                ",
	"                                                                                                   ",
	"                                                                                                   ",
	"                                                                                                   ",
}

require("dashboard").setup({
	theme = "hyper", -- "doom"
	config = {
		header = custom_header,
		weak_header = {
			enabled = true,
		},
		shortcut = {
			--{icon = '  ',
			--desc = 'Recently latest session                  ',
			--shortcut = 'SPC s l',
			--action ='SessionLoad'},
			{
				icon = "  ",
				group = "Label",
				desc = "Recently opened files",
				action = "Telescope oldfiles",
				key = "SPC f r",
			},
			{
				icon = "  ",

				group = "DiagnosticHint",
				desc = "Find  File",
				action = "Telescope find_files",
				key = "SPC f f",
			},
			{
				icon = "  ",
				desc = "Find  word",
				group = "Number",
				action = "Telescope live_grep",
				key = "SPC f g",
			},
			{
				icon = "  ",
				desc = "Git GUI",
				group = "Number",
				action = "Telescope lazygit",
				key = "SPC g g",
			},

			--{icon = '  ',
			--desc = 'Open NeoVim config                      ',
			--action = 'Telescope  path=' .. home ..'/.dotfiles',
			--shortcut = 'SPC f d'},
		},
		project = { limit = 8, action = "Telescope find_files cwd=" },
	},
})
