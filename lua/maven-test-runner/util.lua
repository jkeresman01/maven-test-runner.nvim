local M = {}

function M.get_java_class(bufnr)
    local parser = vim.treesitter.get_parser(bufnr, "java")
    local tree = parser:parse()[1]

    local query = [[
        (class_declaration
          name: (identifier) @class_name
        )
    ]]

    local ts_query = vim.treesitter.query.parse("java", query)

    for id, node in ts_query:iter_captures(tree:root(), bufnr, 0, -1) do
        if ts_query.captures[id] == "class_name" then
            local class_name = vim.treesitter.get_node_text(node, bufnr)
            return class_name
        end
    end

    return ""
end

return M

