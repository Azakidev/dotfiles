-- Lualine is annoying so I rather configure it here

local colors = {
  bg     = '#282a36',
  cl     = '#44475a',
  fg     = '#f8f8f2',
  purple = '#bd93f9',
  green  = '#50fa7b',
  cyan   = '#8be9fd',
  red    = '#ff5555',
}

local dracula_theme = {
  normal = {
    a = { fg = colors.bg, bg = colors.purple },
    b = { fg = colors.fg, bg = colors.cl },
    c = { fg = colors.fg },
  },

  insert = { a = { fg = colors.bg, bg = colors.cyan } },
  visual = { a = { fg = colors.bg, bg = colors.green} },
  replace = { a = { fg = colors.bg, bg = colors.red } },

  inactive = {
    a = { fg = colors.fg, bg = colors.bg },
    b = { fg = colors.fg, bg = colors.bg },
    c = { fg = colors.fg },
  },
}

require('lualine').setup {
  options = {
    theme = dracula_theme,
    component_separators = '',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
    lualine_b = { 'filename', 'branch' },
    lualine_c = {
      '%=', --[[ add your center components here in place of this comment ]]
    },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}

vim.cmd([[hi StatusLine guibg=NONE]])
