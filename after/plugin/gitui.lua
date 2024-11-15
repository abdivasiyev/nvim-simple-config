require('gitui').setup {
  -- Command Options
  command = {
    -- Enable :Gitui command
    -- @type: bool
    enable = false,
  },
  -- Path to binary
  -- @type: string
  binary = "/opt/homebrew/bin/gitui",
  -- Argumens to gitui
  -- @type: table of string
  args = {
	  "-t" == "$HOME/.config/gitui/theme.yml"
  },
  -- WIndow Options
  window = {
    options = {
      -- Border Style
      -- Enum: "none", "single", "rounded", "solid" or "shadow"
      -- @type: string
      border = "rounded",
    },
  },
}

vim.keymap.set("n", "<leader>G", require('gitui').open)

