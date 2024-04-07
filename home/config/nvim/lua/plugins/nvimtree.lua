require("nvim-tree").setup({
    sort = { sorter = "case_sensitive" },
    view = {
        width = 40,
        side = "left",
        number = true,
        relativenumber = true,
    },
    renderer = {
        group_empty = true,
        icons = {
            glyphs = {
                default = "-",
                symlink = "S",
                bookmark = "B",
                modified = "M",
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                    default = "=",
                    open = "#",
                    empty = "E",
                    empty_open = "E",
                    symlink = "S",
                    symlink_open = "O",
                },
                git = {
                    unstaged = "M",
                    staged = "+",
                    unmerged = "U",
                    renamed = "R",
                    untracked = "N",
                    deleted = "R",
                    ignored = "I",
                },
            },
        }
    },
    filters = { dotfiles = true },
    actions = {
        open_file = {
            quit_on_open = true,
        }
    }
})

