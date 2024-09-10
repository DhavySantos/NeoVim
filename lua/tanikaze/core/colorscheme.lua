local file_path = vim.fn.stdpath("data") .. "/colorscheme"

-- Function to write the current colorscheme to a file
local function write_colorscheme()
    local file = io.open(file_path, "w")
    if file then
        file:write(vim.g.colors_name)
        file:close()
    end
end

-- Autocommand to update colorscheme file on ColorScheme event
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = write_colorscheme
})

-- Function to read and apply colorscheme from file
local function apply_colorscheme()
    local file = io.open(file_path, "r")
    if file then
        local colorscheme = file:read()
        file:close()
        if colorscheme then
            vim.cmd.colorscheme(colorscheme)
        end
    end
end

-- Apply colorscheme on startup
apply_colorscheme()
