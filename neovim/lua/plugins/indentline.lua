local status_ok, indent_blankline = pcall(require, "indent_blankline")
 if not status_ok then
  print('indentline unavailable')
 	return
 end

indent_blankline.setup {
  show_current_context = true,
  show_current_context_start = false,
  show_end_of_line = true,
}
