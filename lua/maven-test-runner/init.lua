local ui = require("maven-test-runner.ui")
local mvn = require("maven-test-runner.mvn")

local M = {}

M.setup = function(user_config)
    local keymaps = {
        open    = { "n", "<leader>m", ui.open,      { desc = "Open Maven Test Runner UI"  } },
        close   = { "n", "<leader>c", ui.close,     { desc = "Close Maven Test Runner UI" } },
        execute = { "n", "<CR>",      mvn.execute,  { desc = "Execute Maven Test or Test" } },
    }

    if user_config and user_config.keymaps then
        for key, map in pairs(user_config.keymaps) do
            if keymaps[key] then
                keymaps[key] = map
            end
        end
    end

    for _, map in pairs(keymaps) do
        vim.keymap.set(table.unpack(map))
    end

end

return M

