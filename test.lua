-- print(vim.fn.matchstr('C:/Users/Administrator/AppData/Local/nvim/time.vim','time.vim'))
-- if("vim")then print('www') end

-- print(vim.api.nvim_list_bufs())


























              for k,v in ipairs(vim.api.nvim_list_bufs()) do
                  if (''==vim.api.nvim_buf_get_name(v)) then goto continue end
                  print(vim.api.nvim_buf_get_name(v),vim.fn.matchstr(vim.api.nvim_buf_get_name(v),'packer_init.lua'),''==vim.api.nvim_buf_get_name(v) )
                  if (vim.fn.matchstr(vim.api.nvim_buf_get_name(v),'packer_init.lua') ) then goto continue end

                  print(
                  k,
                  v,
                  'acss',
                  vim.api.nvim_buf_is_valid(v),vim.api.nvim_buf_get_name(v),
                  ':w '..vim.api.nvim_buf_get_name(v)
                  )
                  -- vim.cmd(':w'..)
                  ::continue:: 
              end
