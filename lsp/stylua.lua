return {
    cmd = { "stylua" },
    filetypes = { "lua" },
    root_markers = {
        ".luarc.json",
        ".luarc.jsonc",
        ".luacheckrc",
        ".stylua.toml",
        "stylua.toml",
    },
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "it", "describe", "before_each", "after_each" },
            },
        },
    },
}
