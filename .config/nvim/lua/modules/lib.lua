-- Inspired by The Primeagen

-- Local buffer scoped mappings
function CreateNoremap(type, opts)
	return function(lhs, rhs, bufnr)
		bufnr = bufnr or 0
		vim.api.nvim_buf_set_keymap(bufnr, type, lhs, rhs, opts)
	end
end

LNnoremap = CreateNoremap("n", { noremap = true })

-- Global key mappings
function CreateNoremapGlobal(type, opts)
    return function(lhs, rhs)
        vim.api.nvim_set_keymap(type, lhs, rhs, opts)
    end
end

Nnoremap = CreateNoremapGlobal("n", {noremap = true})
Inoremap = CreateNoremapGlobal("i", {noremap = true})
Vnoremap = CreateNoremapGlobal("v", {noremap = true})




vim.g.mapleader = " "

vim.cmd([[
nnoremap <leader>pv :Ex<CR>
]])


