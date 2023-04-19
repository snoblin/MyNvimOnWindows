local buf_status, bufferline = pcall(require, 'bufferline')
if not buf_status then return end

vim.opt.termguicolors = true

local opts = {
    options = {
        number = nil,
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 20,
        show_buffer_default_icon = true,
        show_close_icon = true,
        show_tab_indicators = true,
        enforce_regular_tabs = true,
        persist_buffer_sort = true,
        always_show_bufferline = true,
        separator_style = "thin",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count)
            return "(" .. count .. ")"
        end,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
                padding = 1
            }, {
                filetype = "lspsagaoutline",
                text = "Lspsaga Outline",
                text_align = "center",
                padding = 1
            }
        }
    },
    -- Change bufferline's highlights here! See `:h bufferline-highlights` for detailed explanation.
    -- Note: If you use catppuccin then modify the colors below!
    highlights = {}
}

if vim.g.colors_name == "catppuccin" then
    local cp = require("modules.utils").get_palette() -- Get the palette.

    local catppuccin_hl_overwrite = {
        highlights = require("catppuccin.groups.integrations.bufferline").get({
            styles = {"italic", "bold"},
            custom = {
                mocha = {
                    -- Hint
                    hint = {fg = cp.rosewater},
                    hint_visible = {fg = cp.rosewater},
                    hint_selected = {fg = cp.rosewater},
                    hint_diagnostic = {fg = cp.rosewater},
                    hint_diagnostic_visible = {fg = cp.rosewater},
                    hint_diagnostic_selected = {fg = cp.rosewater}
                }
            }
        })
    }

    opts = vim.tbl_deep_extend("force", opts, catppuccin_hl_overwrite)
end
bufferline.setup(opts)
