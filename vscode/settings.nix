{ fsharp }:
''
{
  "FSharp.fsacRuntime": "net",
  "FSharp.fsiFilePath": "${fsharp}/bin/fsi",
	"vim.easymotion": true,
	"vim.sneak": true,
	"vim.incsearch": true,
	"vim.useSystemClipboard": true,
	"vim.useCtrlKeys": true,
	"vim.hlsearch": true,
	"vim.insertModeKeyBindings": [
		{
			"before": ["j", "j"],
			"after": ["<Esc>"]
		}
	],
	"vim.normalModeKeyBindingsNonRecursive": [
		{
			"before": ["<leader>", "d"],
			"after": ["d", "d"]
		},
		{
			"before": ["<C-n>"],
			"commands": [":nohl"]
		}
	],
	"vim.leader": "<space>",
	"vim.handleKeys": {
		"<C-a>": false,
		"<C-f>": false
	},

}
''