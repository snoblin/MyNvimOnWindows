# 我的VIM配置
## 简介
电脑重装了个win10，想在wi10上用vim，所以配置了个NeoVim，下面是配置好的效果图：

![图片](https://user-images.githubusercontent.com/47561884/233071377-388c587e-91a8-4b6e-848f-62d91aead83f.png)

## 安装步骤
1. 下载安装vim，由于vim有点老旧，所以安装NeoVim，下载后直接双击Neovim Qt运行，下载链接：https://github.com/neovim/neovim/releases/tag/stable
![图片](https://user-images.githubusercontent.com/47561884/233074519-378da667-ffa9-4a53-8672-cde4ee2c6ccf.png)

2. 安装完成后运行一下健康检查，检查环境是否齐全
![图片](https://user-images.githubusercontent.com/47561884/233074581-1d604f46-bcd6-4216-a68e-5bf96913911f.png)


3. 环境配置

按照官方文档配置（https://github.com/neovim/neovim/wiki/Installing-Neovim）
![图片](https://user-images.githubusercontent.com/47561884/233076430-7f33be83-c2a5-4af9-8cb1-21313b91a4a7.png)
**配置$VIMRUNTIME环境**，这个运行环境是安装目录下的./NeoVim\share\nvim\runtime

**PATH**: 包括neovim的bin和一些后面会用到的软件变量，如图：

![图片](https://user-images.githubusercontent.com/47561884/233077478-9514611d-a5db-4cf5-9a6a-ced8546d53b2.png)

**`：setpell`**: 打开软件直接输入，如果执行失败的话，去官网上下载文件，手动放到目录中去

**init.lua**：核心配置文件，在neovim中，使用lua来配置，目录：C:\Users\your-user-name\AppData\Local\nvim

上面配置好之后记得再次运行健康检查`:checkhealth`

4. lua支持模块化配置，我们创建如下图所示的文件
 ![图片](https://user-images.githubusercontent.com/47561884/233079153-cc315088-6252-4490-a490-4576e2198b82.png)

5. 主要说明一下这几个文件的用途
+ init.lua 核心配置文件，用来加载其他的配置文件
+ options.lua 基础配置，包括一些行号、tab、换行等配置
+ lzay.lua  插件管理器lazy.nvim的配置
+ keymaps.lua 快捷键设置
+ plugins目录下的都是一些插件配置

6. 插件管理器安装

这里选择Lazy.nvim作为插件管理器（主要是有个ui，看起来舒服），直接按照官方文档(https://github.com/folke/lazy.nvim)安装：
这里需要安装Nerd Font(一款字体，不安装的话插件中有些符号无法显示)

![图片](https://user-images.githubusercontent.com/47561884/233081543-9222a94c-9013-4d38-a11f-48a59241dfd4.png)

配置文件如下：
````lua
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
    spec = {
      -- 需要的插件都写在这里
    }
})

````

编写完成后，在init.lua中导入`require('core.lazy')`


安装完成后，输入`:Lazy`，如图：

![图片](https://user-images.githubusercontent.com/47561884/233081016-7cfcc689-2d7a-4e02-9246-88a6291dbced.png)

7. 插件安装示例
  基本上都是在github上找官方文档一步一步安装的，这里就以安装`nvim-tree`为案例演示一下插件安装的方法(https://github.com/nvim-tree/nvim-tree.lua)
  
  ![图片](https://user-images.githubusercontent.com/47561884/233086847-a6e11e33-4f91-4460-b635-2cf75d2659b1.png)

  - 编写lazy.lua
  - 运行`:Lazy`安装
  - 编写配置文件`nvim-tree.lua`
  - init.lua中导入
  - 输入`:so`重新加载配置文件
  
  
  
9. 我装的一些插件

由于我本人只是使用vim查看代码，编写文档，所以并没有安装Lsp（虽然我装了Mason.....）

navarasu/onedark.nvim：主题插件，超爱onedark配色

nvim-tree/nvim-tree.lua：左侧目录树

windwp/nvim-autopairs：自动完成括号、单引号、双引号啥的

nvim-telescope/telescope.nvim： 全局搜索

phaazon/hop.nvim：快速跳转

szw/vim-maximizer：vim窗口最大化

christoomey/vim-tmux-navigator：tmux导航

numToStr/Comment.nvim：注释

tpope/vim-surround：成对符号修改，可以很方便输入成对的符号，例如将一串字符中间的几个字符用括号包裹起来

LSP：
williamboman/mason.nvim| 
illiamboman/mason-lspconfig.nvim| 
neovim/nvim-lspconfig


folke/trouble.nvim ：显示warning

nvim-treesitter/nvim-treesitter 代码高亮

KaraMCC/vim-termtoggle 打开终端

iamcco/markdown-preview.nvim  markdown预览

folke/which-key.nvim：神器，显示vim快捷键

akinsho/bufferline.nvim： 美化，把 buffer 显示成类似 VSCode 中 Tab 页

