require'mason'.setup()
require'mason-lspconfig'.setup()


local startLsp = function(lspname)
 local lspconfig =  require'lspconfig'
 lspconfig[lspname].setup{}
end

vim.api.nvim_create_user_command(
"Runnerlsp", 
function(props)
  startLsp(props.args)
end,
{
  nargs = 1,
  complete = function(_,_)
    return require'mason-lspconfig'.get_installed_servers()
  end

})


