vim.g.mapleader = ' '
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('', '<C-s>', '<cmd>w<CR>')
vim.keymap.set('i', '<C-s>', '<cmd>w<CR>')
vim.keymap.set('', '<C-q>', '<C-w>c')
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true
vim.opt.autoindent=true

vim.opt.number=true
vim.opt.relativenumber=true

vim.opt.autoread=true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

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

vim.keymap.set('n', ',<space>', '<cmd>nohlsearch<CR>')

vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>yy', '"+yy')
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>P', '"+P')
vim.keymap.set('n', '<leader><leader>', 'za')

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')


vim.api.nvim_command("autocmd TermOpen * setlocal nonumber")
vim.api.nvim_command("autocmd TermOpen * setlocal norelativenumber")

vim.keymap.set('n', 'j', '(v:count > 1 ? "m\'" . v:count : "") . "j"', { expr=true })
vim.keymap.set('n', 'k', '(v:count > 1 ? "m\'" . v:count : "") . "k"', { expr=true })

vim.keymap.set('n', '<leader>q', ':bp<bar>sp<bar>bn<bar>bd<CR>', {
  noremap = true,
  silent = true,
  desc = "Close current buffer without closing the window",
})

vim.opt.termguicolors = true

if vim.fn.executable('rg') == 1 then
    vim.o.grepprg = 'rg --no-heading --vimgrep'
    vim.o.grepformat ='%f:%l:%c:%m,%f:%l:%m'
end

local wr_group = vim.api.nvim_create_augroup('WinResize', { clear = true })
local qf_group = vim.api.nvim_create_augroup('Quickfixlist', { clear = true })

vim.api.nvim_create_autocmd(
    'VimResized',
    {
        group = wr_group,
        pattern = '*',
        command = 'wincmd =',
        desc = 'Automatically resize windows when the host window size changes.'
    }
)

vim.api.nvim_create_autocmd(
    'FileType',
    {
        group = qf_group,
        pattern = 'qf',
        command = 'wincmd J',
        desc = 'Place quickfixlist at the bottom'
    }
)

vim.api.nvim_create_autocmd(
    {'VimEnter', 'WinEnter', 'BufWinEnter'},
    {
        group = cursorline_group,
        pattern = '*',
        command = 'setlocal cursorline',
        desc = 'Add cursorline'
    }
)

vim.api.nvim_create_autocmd(
    'WinLeave',
    {
        group = cursorline_group,
        pattern = '*',
        command = 'setlocal nocursorline',
        desc = 'Remove cursorline'
    }
)

-- Display diagnostic source in virtual text and floating window
vim.diagnostic.config({
    virtual_text = {
        source = true,
        format = function(diagnostic)
            if diagnostic.user_data and diagnostic.user_data.code then
                return string.format('%s %s', diagnostic.user_data.code, diagnostic.message)
            else
                return diagnostic.message
            end
        end,
    },
    signs = true,
    float = {
        header = 'Diagnostics',
        source = true,
        border = 'rounded',
    },
})

-- Toggle diagnostics
vim.keymap.set('n', '<leader>tt', function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
    end,
    {
        silent = true,
        noremap = true
    }
)

require('config.lazy')
