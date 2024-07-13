local M = {}

M.execute = function()
    local bufnr = vim.api.nvim_win_get_buf(vim.api.nvim_get_current_win())

    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

    local className = string.match(lines[3], "CLASS:%s*(.*)")
    local testName = string.match(lines[5], "TEST:%s*(.*)")

    local command = string.format("mvn test -Dtest=%s#%s", className, testName)

    vim.cmd('vsplit term://bash')
    vim.fn.termopen(command)

    vim.cmd('wincmd p')
end

return M
