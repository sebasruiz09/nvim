vim.o.completeopt = "menu,menuone,noselect"

return {
    "hrsh7th/nvim-cmp",
    dependencies = {'neovim/nvim-lspconfig', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',
                    'hrsh7th/cmp-cmdline', 'hrsh7th/cmp-vsnip', 'hrsh7th/vim-vsnip', 'onsails/lspkind.nvim'},
    config = function()
        require('lspkind').init({

            mode = 'symbol_text',
            preset = 'codicons',
            symbol_map = {
                Text = "",
                Method = "",
                Function = "",
                Constructor = "",
                Field = "ﰠ",
                Variable = "",
                Class = "ﴯ",
                Interface = "",
                Module = "",
                Property = "ﰠ",
                Unit = "塞",
                Value = "",
                Enum = "",
                Keyword = "",
                Snippet = "",
                Color = "",
                File = "",
                Reference = "",
                Folder = "",
                EnumMember = "",
                Constant = "",
                Struct = "פּ",
                Event = "",
                Operator = "",
                TypeParameter = ""
            }
        })

        local cmp = require "cmp"
        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body) 
                end
            },
            window = {
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<Tab>'] = cmp.mapping.select_next_item(),
                ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                ['<CR>'] = cmp.mapping.confirm({
                    select = true
                }) 
            }),
            sources = cmp.config.sources({{
                name = 'nvim_lsp'
            }, {
                name = 'vsnip'
            } 
            }, {{
                name = 'buffer'
            }}),
            formatting = {
                format = function(entry, vim_item)
                    local lspkind = require("lspkind")
                    if vim.tbl_contains({'path'}, entry.source.name) then
                        local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
                        if icon then
                            vim_item.kind = icon
                            vim_item.kind_hl_group = hl_group
                            return vim_item
                        end
                    end
                    return lspkind.cmp_format({
                        with_text = false
                    })(entry, vim_item)
                end
            }
        })
        cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({{
                name = 'cmp_git'
            } 
            }, {{
                name = 'buffer'
            }})
        })

        cmp.setup.cmdline({'/', '?'}, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {{
                name = 'buffer'
            }}
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({{
                name = 'path'
            }}, {{
                name = 'cmdline'
            }})
        })

        local devicons = require('nvim-web-devicons')
        cmp.register_source('devicons', {
            complete = function(_, _, callback)
                local items = {}
                for _, icon in pairs(devicons.get_icons()) do
                    table.insert(items, {
                        label = icon.icon .. '  ' .. icon.name,
                        insertText = icon.icon,
                        filterText = icon.name
                    })
                end
                callback({
                    items = items
                })
            end
        })

        local lspconfig = require "lspconfig"
        local servers = require"mason-lspconfig".get_installed_servers()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        for _, server in pairs(servers) do
            lspconfig[server].setup {
                capabilities = capabilities
            }
        end
    end
}
