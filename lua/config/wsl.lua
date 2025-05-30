local win32yank = vim.fn.executable("win32yank.exe")

local function set_up_yank32_clipboard()

        vim.g.clipboard = {
                name = "win32yank",
                copy = {
                        ["+"] = "win32yank.exe -i --crlf",
                        ["*"] = "win32yank.exe -i --crlf",
                },
                paste = {
                        ["+"] = "win32yank.exe -o --lf",
                        ["*"] = "win32yank.exe -o --lf",
                },
                cache_enabled = 0,
        }
end

if win32yank == 1 then 
        set_up_yank32_clipboard()
end

-- copilot  node configuration

local node_version = "v20.19.1"
local distribution = vim.fn.system("lsb_release -i -s")
distribution = distribution:gsub("%s+", "")

-- Set the node command based on the distribution
if distribution == "Ubuntu" then
        vim.g.copilot_node_command = string.format("~/.nvm/versions/node/%s/bin/node", node_version)

        -- install win32 yank for clipboard sync and support in wsl
        
        set_up_yank32_clipboard()
end

