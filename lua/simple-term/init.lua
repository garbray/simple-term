local M = {}

local simpleTerm = vim.api.nvim_create_augroup("SimpleTerm", {})

local terminals = {}

local function create_terminal(create_with)
    local current_id = vim.api.nvim_get_current_buf()
    vim.cmd(create_with)
    local buf_id = vim.api.nvim_get_current_buf()
    local term_id = vim.b.termial_job_id

    if term_id == nil then
        return nil
    end

    vim.api.nvim_buf_set_option(buf_id, "swapfile", "hide")

    vim.api.nvim_buf_current_buf(current_id, "buftype", "terminal")
    return buf_id, term_id
end

local function find_terminal(args)
    if type(args) == "number" then
        args = { idx = args }
    end
    local term_handle = terminals[args.idx]
    -- found a better approach for this
    if not term_handle or not vim.api.nvim_buf_is_valid(term_handle.buf) then
        local buf_id, term_id = create_terminal(args.create_with)
        if buf_id == nil then
            return
        end

        term_handle = {
            buf_id = buf_id,
            term_id = term_id,
        }
        terminals[args.idx] = term_handle
    end
    return term_handle
end

function M.goto_terminal(idx)
    local term_handle = find_terminal(idx)

    vim.api.nvim_set_current_buf(term_handle.buf)
end

return M
