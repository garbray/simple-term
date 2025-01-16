local M = {}

local terminals = {}

local function create_terminal(create_with)
	if not create_with then
		create_with = ":terminal"
	end
	-- log.trace("term: _create_terminal(): Init:", create_with)
	local current_id = vim.api.nvim_get_current_buf()

	vim.cmd(create_with)
	local buf_id = vim.api.nvim_get_current_buf()
	local term_id = vim.b.terminal_job_id

	if term_id == nil then
		-- log.error("_create_terminal(): term_id is nil")
		-- TODO: Throw an error?
		return
	end

	-- Make sure the term buffer has "hidden" set so it doesn't get thrown
	-- away and cause an error
	vim.api.nvim_buf_set_option(buf_id, "bufhidden", "hide")

	-- Resets the buffer back to the old one
	vim.api.nvim_set_current_buf(current_id)
	return buf_id, term_id
end

local function find_terminal(args)
	if type(args) == "number" then
		args = { idx = args }
	end

	local term_handle = terminals[args.idx]
	-- found a better approach for this
	if not term_handle or not vim.api.nvim_buf_is_valid(term_handle.buf_id) then
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

---@param idx number
function M.goto_terminal(idx)
	local term_handle = find_terminal(idx)

	vim.api.nvim_set_current_buf(term_handle.buf_id)
end

return M
