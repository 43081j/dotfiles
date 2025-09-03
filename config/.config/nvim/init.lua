require("config.lazy")
require("lsp_signature").setup()
local fzf = require("fzf-lua")
local cmp = require('cmp')

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
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', '[g', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']g', vim.diagnostic.goto_next)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
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

-- syntax/tree-sitter stuff
require'nvim-treesitter'.install { 'typescript', 'javascript', 'json', 'svelte', 'html', 'css' }
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'typescript', 'javascript', 'json', 'svelte', 'html', 'css' },
  callback = function()
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

-- language servers
local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.lsp.enable('tsgo', { capabilities = capabilities })
vim.lsp.enable('svelte')
vim.lsp.enable('eslint')

cmp.setup({
  completion = {
    autocomplete = false,
  },
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- these don't work for whatever reason
    -- ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    -- ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  })
})
