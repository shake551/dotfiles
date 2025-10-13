vim.g.mapleader = '\\'
-- キーマッピングの設定
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<CR>', { noremap = true, silent = true })

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
    cmd = "lazygit",
    direction = "float",
    hidden = true
})

function _lazygit_toggle() lazygit:toggle() end

vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>",
                        {noremap = true, silent = true})

local claudeCode = Terminal:new({
    cmd = "claude",
    direction = "vertical",
    hidden = true,
    -- windwサイズを画面の半分に設定
    on_open = function(term)
	vim.cmd("vertical resize " .. math.floor(vim.o.columns / 2))
    end
})

function _claudeCode_toggle() claudeCode:toggle() end

vim.api.nvim_set_keymap("n", "<leader>cc", "<cmd>lua _claudeCode_toggle()<CR>",
                        {noremap = true, silent = true})

local geminiCli = Terminal:new({
    cmd = "gemini",
    direction = "vertical",
    hidden = true,
    -- windwサイズを画面の半分に設定
    on_open = function(term)
	vim.cmd("vertical resize " .. math.floor(vim.o.columns / 2))
    end
})

function _geminiCli_toggle() geminiCli:toggle() end

vim.api.nvim_set_keymap("n", "<leader>gc", "<cmd>lua _geminiCli_toggle()<CR>",
                        {noremap = true, silent = true})

-- dap
vim.api.nvim_set_keymap('n', '<F5>', ':DapContinue<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<F10>', ':DapStepOver<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<F11>', ':DapStepInto<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<F12>', ':DapStepOut<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', ':DapToggleBreakpoint<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>B', ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Breakpoint condition: "))<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>lp', ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>dr', ':lua require("dap").repl.open()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>dl', ':lua require("dap").run_last()<CR>', { silent = true })

vim.api.nvim_set_keymap('n', '<leader>d', ':lua require("dapui").toggle()<CR>', {})
