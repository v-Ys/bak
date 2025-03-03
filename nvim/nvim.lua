local vimtex = {
        "lervag/vimtex",
        config = function()
                vim.g.tex_flavor = "latex" -- Default tex file format

                -- vim.g.vimtex_indent_bib_enabled = 0
                -- vim.g.vimtex_indent_enabled = 0

                vim.g.vimtex_complete_enabled = 0
                -- Disable imaps (using Ultisnips)
                vim.g.vimtex_imaps_enabled = 0
                -- auto open quickfix on compile erros
                vim.g.vimtex_quickfix_mode = 0
                vim.g.vimtex_view_method = 'skim'

                -- vim.g.vimtex_view_method = "sioyek"

                vim.g.vimtex_compiler_latexmk_engines = {
                        _ = "-lualatex",
                        pdflatex = "-pdf",
                        dvipdfex = "-pdfdvi",
                        lualatex = "-lualatex",
                        xelatex = "-xelatex",
                }
        end,
        dependencies = {
                "ybian/smartim",
                config = function()
                        vim.g.smartim_default = "com.apple.keylayout.ABC"
                end,
        },
        ft = "tex",
}


local runCode = {
        c = function()
                vim.cmd("TermExec cmd=\"cd %:p:h && clang %:t -o %:t:r && ./%:t:r && rm %:t:r\"")
        end,

        -- cpp = function()
        --         vim.cmd("TermExec cmd=\"cd %:p:h && clang++ %:t -o %:t:r && ./%:t:r && rm %:t:r\"")
        -- end,

        --cpp 20
        cpp = function()
                vim.cmd(
                        "TermExec cmd=\"cd %:p:h && clang++ -std=c++20 -fmodules %:t -o %:t:r && ./%:t:r && rm %:t:r\"")
        end,

        go = function()
                vim.cmd(
                        "TermExec cmd=\"cd %:p:h && go run %:t\"")
        end,
        python = function()
                vim.cmd("TermExec cmd=\"cd %:p:h && python3 %:t\"")
        end,

        rust = function()
                vim.cmd("TermExec cmd=\"cd %:p:h && cargo run\"")
        end,

        markdown = function()
                vim.cmd("silent! !open %")
        end,

        typst = function()
                vim.cmd("silent! !open -a Skim.app %:p:r.pdf")
        end,
        scheme = function()
                vim.cmd("TermExec cmd=\"cd %:p:h && racket %:t\"")
        end
}

local nullls_config = function()
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting
        local completion = null_ls.builtins.completion
        null_ls.setup({
                debug = false,
                sources = {
                        formatting.black,
                        completion.spell,
                },
        })
end

-- telescope theme
-- prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
-- results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
-- preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },


-- Terminal window navigation
-- { { "t", }, "<C-h>",  "<C-\\><C-N><C-w>h", opts },
-- { { "t", }, "<C-j>",  "<C-\\><C-N><C-w>j", opts },
-- { { "t", }, "<C-k>",  "<C-\\><C-N><C-w>k", opts },
-- { { "t", }, "<C-l>",  "<C-\\><C-N><C-w>l", opts },
