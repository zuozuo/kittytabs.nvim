local M = {}

-- 默认配置
local config = {
    command_name = "kittytabs",
}
-- 设置函数
function M.setup(opts)
    -- 合并用户配置
    config = vim.tbl_deep_extend("force", config, opts or {})
end

return M 
