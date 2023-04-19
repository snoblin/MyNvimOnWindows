local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then return end
-- Start setup
lazy.setup({
    spec = { -- Colorscheme:
        -- The colorscheme should be available when starting Neovim.
        {
            'navarasu/onedark.nvim',
            lazy = false, -- make sure we load this during startup if it is your main colorscheme
            config = function()
                require('onedark').setup {style = 'darker'}
                require('onedark').load()
            end
        }, {
            "nvim-tree/nvim-tree.lua",
            version = "*",
            dependencies = {"nvim-tree/nvim-web-devicons"},
            config = function() require("nvim-tree").setup {} end
        }, {
            "windwp/nvim-autopairs",
            config = function() require("nvim-autopairs").setup {} end
        }, {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.1',
            -- or                              , branch = '0.1.1',
            dependencies = {'nvim-lua/plenary.nvim'}
        }, {
            'phaazon/hop.nvim',
            branch = 'v2', -- optional but strongly recommended
            config = function()
                -- you can configure Hop the way you like here; see :h hop-config
                require'hop'.setup {keys = 'etovxqpdygfblzhckisuran'}
            end
        }, {'szw/vim-maximizer'}, {'christoomey/vim-tmux-navigator'},
        {
            'numToStr/Comment.nvim',
            config = function() require('Comment').setup() end
        }, {'tpope/vim-surround'}, {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            build = ":MasonUpdate" -- :MasonUpdate updates registry contents
        },{
            "folke/trouble.nvim",
            requires = "nvim-tree/nvim-web-devicons"
        },{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},{
            'KaraMCC/vim-termtoggle'
        },{
            "iamcco/markdown-preview.nvim",
            run = function() vim.fn["mkdp#util#install"]() end,
        },{
            "folke/which-key.nvim",
            config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })end,
        },{'akinsho/bufferline.nvim', version = "v3.*", dependencies = 'nvim-tree/nvim-web-devicons'}
    }
})
