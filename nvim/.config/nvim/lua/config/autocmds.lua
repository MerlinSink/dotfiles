-- local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", { clear = true, })
-- local autocmd = vim.api.nvim_create_autocmd
local function CodeRunner()
  --[===[========================== Static ===========================]===]
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "c",
    callback = function()
      -- -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
      vim.api.nvim_buf_set_keymap(
        0,
        "n",
        "<F3>",
        "<ESC>:w<CR>:split<CR>:te gcc -o %:t:r.out % -g  && time ./%:t:r.out<CR>i",
        { silent = true, noremap = true }
      )
      -- vim.api.nvim_buf_set_keymap(
      --     0,
      --     "n",
      --     "<F8>",
      --     "<ESC>:w<CR>:split<CR>:te clang -std=c11 -Wshadow -Wall -o %:t:r.out % -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && time ./%:t:r.out<CR>i",
      --     { silent = true, noremap = true }
      -- )
    end,
  })

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    callback = function()
      -- -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
      vim.api.nvim_buf_set_keymap(
        0,
        "n",
        "<F3>",
        "<ESC>:w<CR>:split<CR>:te g++ -o %:t:r.out % -g  && time ./%:t:r.out<CR>i",
        { silent = true, noremap = true }
      )
      -- vim.api.nvim_buf_set_keymap(
      --     0,
      --     "n",
      --     "<F8>",
      --     "<ESC>:w<CR>:split<CR>:te clang++ -std=c++20 -Wshadow -Wall -o %:t:r.out % -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && time ./%:t:r.out<CR>i",
      --     { silent = true, noremap = true }
      -- )
    end,
  })
end

-- 自动切换输入法
-- autocmd("InsertLeave", {
--   group = myAutoGroup,
--   callback = require("utils.im-select").winInsertLeave,
-- })
-- autocmd("InsertEnter", {
--   group = myAutoGroup,
--   callback = require("utils.im-select").winInsertEnter,
-- })

vim.cmd [[

" telescope
augroup _fold_bug_solution  " https://github.com/nvim-telescope/telescope.nvim/issues/559
    autocmd!
    autocmd BufRead * autocmd BufWinEnter * ++once normal! zx
  augroup end

" windows copy
augroup fix_yank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call system('/mnt/c/Windows/System32/clip.exe', @0) | endif
augroup END

" leap
autocmd ColorScheme * lua require('leap').init_highlight(true)

]]
