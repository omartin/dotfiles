local status_ok, gitmessenger = pcall(require, "git-messenger")
if not status_ok then
  print('git-messenger unavailable')
  return
end

gitmessenger.setup {}
