return {
    cmd = { "superhtml", "lsp" },
    filetypes = { "html" },
    root_markers = {
        "html.json",
        ".git",
    },
    settings = {
        html = {
            diagnostics = {
                enable = true,
            },
        },
    },
}

