local db = require("dashboard")

db.custom_header = {
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

db.custom_center = {
	--{icon = '  ',
	--desc = 'Recently latest session                  ',
	--shortcut = 'SPC s l',
	--action ='SessionLoad'},
	{
		icon = "  ",
		desc = "Recently opened files                   ",
		action = "Telescope oldfiles",
		shortcut = "SPC f r",
	},
	{
		icon = "  ",
		desc = "Find  File                              ",
		action = "Telescope find_files",
		shortcut = "SPC f f",
	},
	{
		icon = "  ",
		desc = "Find  word                              ",
		action = "Telescope live_grep",
		shortcut = "SPC f g",
	},
	{
		icon = "  ",
		desc = "Git GUI                                 ",
		action = "Telescope lazygit",
		shortcut = "SPC g g",
	},

	--{icon = '  ',
	--desc = 'Open NeoVim config                      ',
	--action = 'Telescope  path=' .. home ..'/.dotfiles',
	--shortcut = 'SPC f d'},
}
