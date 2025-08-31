require("config.lazy")
local fzf = require("fzf-lua")

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.nu = true
vim.opt.diffopt:append("vertical")
vim.opt.cursorline = true
vim.opt.scrolloff = 5
vim.opt.cc = '80'
vim.opt.backup = false

vim.cmd.colorscheme("dracula")

-- Bindings

vim.keymap.set("n", "<c-p>", ":FzfLua files<CR>")
vim.keymap.set("n", "<leader>a", ":FzfLua buffers<CR>")
vim.keymap.set("n", "<leader>/", ":FzfLua grep_project<CR>")
vim.keymap.set("n", "<leader>gc", ":FzfLua git_commits<CR>")
vim.keymap.set("n", "<leader>gb", ":FzfLua git_bcommits<CR>")
vim.keymap.set("n", "<leader>gf", ":FzfLua git_files<CR>")
vim.keymap.set({ "i" }, "<C-x><C-f>",
  function() require("fzf-lua").complete_path() end,
  { silent = true, desc = "Complete files fuzzily" })
vim.keymap.set({'n', 'i', 'v'}, '<Up>', '<nop>')
vim.keymap.set({'n', 'i', 'v'}, '<Down>', '<nop>')
vim.keymap.set({'n', 'i', 'v'}, '<Left>', '<nop>')
vim.keymap.set({'n', 'i', 'v'}, '<Right>', '<nop>')
vim.keymap.set('n', 'gd', vim.lsp.buf.type_definition)
vim.keymap.set('n', '[g', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']g', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<c-^>', vim.lsp.buf.references)
-- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
-- vim.keymap.set('n', '<c-n>', 'Vexplore')

-- Crazy ast-grep bindings in vim

local function sg_run_picker()
  vim.ui.input({ prompt = "sg: " }, function(input)
    if not input or input == "" then return end
    local escaped = vim.fn.shellescape(input)
    local cmd = string.format('sg run --heading=never --color=always --pattern=%s | awk -F ":" \'!seen[$1]++\'', escaped)
    fzf.fzf_exec(cmd, {
      prompt = "sg> ",
    })
  end)
end

vim.keymap.set('n', '<leader>sg', sg_run_picker, { desc = "ast-grep picker" })

-- language servers
vim.lsp.enable('tsgo')
