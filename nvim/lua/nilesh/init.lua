-- telescope
local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = '❯ ',
        selection_caret = '❯ ',
        prompt_position = 'top',
        sorting_strategy = 'ascending',
        width = 0.9,

        mappings = {
          i = {
            ["<esc>"] = actions.close,
            ["<C-w>"] = actions.smart_send_to_qflist
          },
        },
    },
    pickers = {
      buffers = {
        mappings = {
          i = {
            ["<c-r>"] = "delete_buffer",
          }
        }
      }
    },
    -- extensions = {
    --     fzy_native = {
    --         override_generic_sorter = true,
    --         override_file_sorter = true,
    --     }
    -- }
    extensions = {
      fzf = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = false,   -- override the file sorter
        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      }
    }
  }

-- require('telescope').load_extension('fzy_native')
require('telescope').load_extension('fzf')

-- treesitter
--- additional_vim_regex_highlighting=true is a workaround so that vim-endwise
--- works with treesitter
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}

local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = "$HOME/.config/nvim/",
    })
end

return M
