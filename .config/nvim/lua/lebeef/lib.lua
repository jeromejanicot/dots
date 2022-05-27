local g = vim.g

function CreateNoremap(type, opts)
	return function(lhs, rhs, bufnr)
		bufnr = bufnr or 0
		vim.api.nvim_buf_set_keymap(bufnr, type, lhs, rhs, opts)
	end
end

Nnoremap = CreateNoremap("n", { noremap = true })

vim.api.nvim_set_keymap("n", " ", "", { noremap = true })

g.mapleader = " "
