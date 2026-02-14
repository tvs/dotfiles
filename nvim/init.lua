configdir = os.getenv("XDG_CONFIG_HOME") or "~/.config/nvim"
-- TODO: Convert to lua config
configs = {
	"commands.vim", -- custom commands
	"plugins.vim", -- plugins and their config
	"config.vim", -- general vim config
	"mappings.vim", -- custom mappings
	--"coc.vim", -- coc config
	"ufo.vim" -- ufo config
}

for _, conf in ipairs(configs) do
	vim.cmd("source " .. configdir .. "/" .. conf)
end
