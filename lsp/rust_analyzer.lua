return {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = {
        "Cargo.toml",
        "Cargo.lock",
        ".git",
    },
    settings = {
        rust = {
            diagnostics = {
                enable = true,
            },
        },
    },
}
