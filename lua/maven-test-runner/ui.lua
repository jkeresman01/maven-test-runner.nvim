local util = require("maven-test-runner.util")

local M = {}

M.open = function()
    local border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }

    local java_class_bufnr = vim.api.nvim_get_current_buf()
    local java_class = util.get_java_class(java_class_bufnr)

    local bufnr = vim.api.nvim_create_buf(true, false)
    local width = 60
    local height = 10
    local row = math.floor((vim.api.nvim_win_get_height(0) - height) / 2)
    local col = math.floor((vim.api.nvim_win_get_width(0)  - width)  / 2)

    local winid = vim.api.nvim_open_win(bufnr, true, {
        relative = 'editor',
        width = width,
        height = height,
        row = row,
        col = col,
        style = 'minimal',
        border = border,
    })

    local lines = {
        '--------------(   MAVEN TEST RUNNER   )--------------',
        '',
        'CLASS:' .. java_class,
        '',
        'TEST:',
    }

    local first_line = lines[1]
    local line_length = #first_line
    local spaces = string.rep(' ', math.floor((width - line_length) / 2))
    local centered_first_line = spaces .. first_line

    local centered_lines = {centered_first_line}
    for i = 2, #lines do
        table.insert(centered_lines, lines[i])
    end

    vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, centered_lines)
    vim.api.nvim_win_set_cursor(winid, { 3, #('CLASS:') })
    vim.api.nvim_win_set_option(winid, 'winhighlight', 'Normal:NormalFloat,FloatBorder:Float')

    vim.cmd('highlight NormalFloat guibg=none ctermbg=none')
end

M.close = function()
    local bufnr = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_delete(bufnr, { force = true })
end

return M

