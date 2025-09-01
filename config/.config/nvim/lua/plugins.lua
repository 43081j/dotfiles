return {
  {
    "ibhagwan/fzf-lua",
    opts = {}
  },
  {
    "neovim/nvim-lspconfig"
  },
  {
    "numToStr/Comment.nvim"
  },
  {
    "vim-airline/vim-airline"
  },
  {
    "dracula/vim"
  },
  {
    "tpope/vim-fugitive"
  },
  {
    "airblade/vim-gitgutter"
  },
  {
    "jeffkreeftmeijer/vim-numbertoggle"
  },
  {
    "tpope/vim-surround"
  },
  {
    "tpope/vim-unimpaired"
  },
  {
    "github/copilot.vim"
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
    }
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    branch = 'main',
    lazy = false,
    build = ":TSUpdate"
  }
}
-- Plug 'justinmk/vim-dirvish'
-- Plug 'vim-airline/vim-airline-themes'
