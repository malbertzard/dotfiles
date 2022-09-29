local dap_status_ok, dressing = pcall(require, "dressing")
if not dap_status_ok then
  return
end

dressing.setup({})

