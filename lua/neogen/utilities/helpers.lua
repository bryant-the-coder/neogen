local config = require("neogen.config")
return {
    notify = function(msg, log_level)
        vim.notify(msg, log_level, { title = "Neogen" })
    end,

    --- Generates a list of possible types in the current language
    ---@private
    match_commands = function()
        if vim.bo.filetype == "" then
            return {}
        end

        local language = config.get().languages[vim.bo.filetype]

        if not language or not language.parent then
            return {}
        end

        return vim.tbl_keys(language.parent)
    end,
    split = function(s, sep, plain)
        return vim.fn.has("nvim-0.6") == 1 and vim.split(s, sep, { plain = plain }) or vim.split(s, sep, plain)
    end,
}
