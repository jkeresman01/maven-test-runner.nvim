local ui = require("maven-test-runner.ui")

local M = {}

M.execute = function()
    local bufnr = vim.api.nvim_win_get_buf(vim.api.nvim_get_current_win())

    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

    local class_name = string.match(lines[3], "CLASS:%s*(.*)")
    local test_name = string.match(lines[5], "TEST:%s*(.*)")

    local mvn_test_command = string.format("mvn test -Dtest=%s#%s", class_name, test_name)

    vim.cmd('vsplit term://bash')
    vim.fn.termopen(mvn_test_command)

    vim.cmd('wincmd p')

    ui.close()
end

return M
