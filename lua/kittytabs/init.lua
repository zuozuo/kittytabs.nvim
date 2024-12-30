local M = {}

-- 默认配置
local config = {
    command_name = "kittytabs",
    exit_on_selected = true,
    -- AI! the below code for find script path is wrong, change it
    script_path = vim.fn.fnamemodify(vim.fn.resolve(vim.fn.expand('<sfile>:p')), ':h:h') .. '/scripts/kittytabs.sh'
}

-- 设置函数
function M.setup(opts)
    -- 合并用户配置
    config = vim.tbl_deep_extend("force", config, opts or {})
end

-- 获取脚本路径
function M.get_script_path()
    return config.script_path
end

function M.kittyStartupTabs()
    local script_path = M.get_script_path()
    local exit_opt = config.exit_on_selected and "--exit_all=1" or ""
    vim.notify("Starting kitty tabs with " .. exit_opt)
    vim.notify("Script path: " .. script_path)
    vim.notify("Command name: " .. config.command_name)
    local cmd = string.format(
        "FloatermNew %s bash %s",
        exit_opt,
        script_path
    )
    vim.cmd(cmd)
end

return M 
