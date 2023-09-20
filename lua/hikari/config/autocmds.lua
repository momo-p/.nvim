local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- General settings

-- Highlight on yank
autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = "1000"
        })
    end
})

-- Remove whitespace on save
autocmd("BufWritePre", {
    pattern = "",
    command = ":%s/\\s\\+$//e"
})

-- Auto format on save using the attached (optionally filtered) language servere clients
-- https://neovim.io/doc/user/lsp.html#vim.lsp.buf.format()
autocmd("BufWritePre", {
    pattern = "",
    command = ":silent lua vim.lsp.buf.format()"
})

-- Don"t auto commenting new lines
autocmd("BufEnter", {
    pattern = "",
    command = "set fo-=c fo-=r fo-=o"
})

autocmd("Filetype", {
    pattern = {"xml", "html", "xhtml", "css", "scss", "javascript", "typescript", "yaml", "lua"},
    command = "setlocal shiftwidth=2 tabstop=2"
})

autocmd("Filetype", {
    pattern = {"go", "make"},
    command = "set noet ci pi sts=0 sw=4 ts=4"
})

-- Set colorcolumn
autocmd("Filetype", {
    pattern = {"python", "rst", "c", "cpp"},
    command = "set colorcolumn=80"
})

autocmd("Filetype", {
    pattern = {"gitcommit", "markdown", "text"},
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end
})
