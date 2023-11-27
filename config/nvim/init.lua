vim.g.mapleader = ' '
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('', '<C-s>', '<cmd>w<CR>')
vim.keymap.set('', '<C-q>', '<C-w>c')
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true
vim.opt.autoindent=true

vim.opt.number=true
vim.opt.relativenumber=true

-- Better mappings for Finnish keyboard layout. [[, ]] etc. have to be mapped
-- separately from the single character variants for them to work.
vim.keymap.set('', 'ö', '[', { remap = true })
vim.keymap.set('', 'ä', ']', { remap = true })
vim.keymap.set('', 'öö', '[[', { remap = true })
vim.keymap.set('', 'ää', ']]', { remap = true })
vim.keymap.set('', 'öä', '[]', { remap = true })
vim.keymap.set('', 'äö', '][', { remap = true })
vim.keymap.set('', 'öÖ', '[{', { remap = true })
vim.keymap.set('', 'äÄ', ']}', { remap = true })
vim.keymap.set('', 'Ö', '{', { remap = true })
vim.keymap.set('', 'Ä', '}', { remap = true })
vim.keymap.set('', 'å', '`', { remap = true })

vim.keymap.set('n', '<TAB>', '<cmd>bnext<CR>')
vim.keymap.set('n', '<S-TAB>', '<cmd>bprevious<CR>')

vim.keymap.set('n', '<leader><space>', '<cmd>nohlsearch<CR>')

vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>yy', '"+yy')
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>P', '"+P')


vim.opt.termguicolors = true

require('manu.lazy')
