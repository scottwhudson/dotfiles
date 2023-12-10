function WatchForChanges(bufname, ...)
  if bufname == '*' then
    local id = 'WatchForChanges'..'AnyBuffer'
    local bufspec = ''
  else
    local bufnr = vim.fn.bufnr(bufname)
    if bufnr == -1 then
      print("Buffer " .. bufname .. " doesn't exist")
      return
    end
    local id = 'WatchForChanges'..bufnr
    local bufspec = bufname
  end

  local options = {}
  if select('#', ...) > 0 then
    if type(...) == 'table' then
      options = ...
    else
      print("Argument must be a table")
      return
    end
  end

  local autoread = options.autoread or 0
  local toggle = options.toggle or 0
  local disable = options.disable or 0
  local more_events = options.more_events or 1
  local while_in_this_buffer_only = options.while_in_this_buffer_only or 0

  local event_bufspec = while_in_this_buffer_only and bufname or '*'

  local reg_saved = vim.fn.getreg('@')
  -- local autoread_saved = vim.o.autoread  -- Uncomment this line if needed

  local defined = vim.fn.exists('*' .. id) == 1
  if not defined then
    if autoread == 1 then
      print('Autoread enabled - ')
      if bufname == '*' then
        vim.api.nvim_set_option('autoread', true)
      else
        vim.api.nvim_buf_set_option(0, 'autoread', true)
      end
    end

    vim.api.nvim_command('augroup ' .. id)
    if bufname ~= '*' then
      vim.api.nvim_command('autocmd! BufDelete ' .. bufspec .. ' execute "au! ' .. id .. '" | execute "augroup! ' .. id .. '"')
    end
    vim.api.nvim_command('autocmd BufEnter ' .. event_bufspec .. ' checktime ' .. bufspec)
    vim.api.nvim_command('autocmd CursorHold ' .. event_bufspec .. ' checktime ' .. bufspec)
    vim.api.nvim_command('autocmd CursorHoldI ' .. event_bufspec .. ' checktime ' .. bufspec)
    if more_events == 1 then
      vim.api.nvim_command('autocmd CursorMoved ' .. event_bufspec .. ' checktime ' .. bufspec)
      vim.api.nvim_command('autocmd CursorMovedI ' .. event_bufspec .. ' checktime ' .. bufspec)
    end
    vim.api.nvim_command('augroup END')

    print('Now watching ' .. bufspec .. ' for external updates...')
  end

  if disable == 1 or (toggle == 1 and defined) then
    if autoread == 1 then
      print('Autoread disabled - ')
      if bufname == '*' then
        vim.api.nvim_set_option('autoread', false)
      else
        vim.api.nvim_buf_set_option(0, 'autoread', false)
      end
    end
    vim.api.nvim_command('autocmd! ' .. id)
    vim.api.nvim_command('augroup! ' .. id)

    print('No longer watching ' .. bufspec .. ' for external updates.')
  elseif defined then
    print('Already watching ' .. bufspec .. ' for external updates')
  end

  vim.fn.setreg('@', reg_saved)
end

local autoreadargs = {autoread = 1}
WatchForChanges('*', autoreadargs)
