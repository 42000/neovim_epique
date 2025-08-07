local vert_inc = 2
local hori_inc = 4

vim.keymap.set({'n', 'v', 'i'}, '<A-l>','<C-w>l', {silent=true})
vim.keymap.set({'n', 'v', 'i'}, '<A-h>','<C-w>h', {silent=true})
vim.keymap.set({'n', 'v', 'i'}, '<A-k>','<C-w>k', {silent=true})
vim.keymap.set({'n', 'v', 'i'}, '<A-j>','<C-w>j', {silent=true})

local function winnr(direction)
    return vim.api.nvim_call_function("winnr", { direction })
end

local function is_nvim_border(border)
    return winnr() == winnr("1" .. border)
end

function resize(axis, direction, step_size)
    local command = "resize "
    if axis == "x" then
        command = "vertical resize "
    end

    return vim.api.nvim_command(command .. direction .. step_size)
end

local function resize_left()
    local step = hori_inc
    local is_border = is_nvim_border("l")
    if is_border then
        resize("x", "-", step)
    else
        resize("x", "+", step)
    end
end

local function resize_right()
    local step = hori_inc
    local is_border = is_nvim_border("h")
    if is_border then
        resize("x", "-", step)
    else
        resize("x", "+", step)
    end
end

local function resize_up()
    local step = vert_inc
    local is_border = is_nvim_border("j")
    if is_border then
        resize("y", "-", step)
    else
        vim.fn.win_move_statusline(0, -step)
    end
end

local function resize_down()
    local step = vert_inc
    local is_border = is_nvim_border("j")
    if is_border then
        resize("y", "+", step)
    else
        vim.fn.win_move_statusline(0, step)
    end
end

vim.keymap.set({'n', 'v', 'i'}, '<C-A-l>',resize_left, {silent=true})
vim.keymap.set({'n', 'v', 'i'}, '<C-A-h>',resize_right, {silent=true})
vim.keymap.set({'n', 'v', 'i'}, '<C-A-k>',resize_up, {silent=true})
vim.keymap.set({'n', 'v', 'i'}, '<C-A-j>',resize_down, {silent=true})
