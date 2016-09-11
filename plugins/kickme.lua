local function run(msg, matches)
if matches[1] == 'kickme' then
local hash = 'kick:'..msg.to.id..':'..msg.from.id
     redis:set(hash, "waite")
      return '🔖hello user ('..msg.from.username..')\nyou are sended a kick request..\nsend y to kick from group or no to cancel'
    end

    if msg.text then
	local hash = 'kick:'..msg.to.id..':'..msg.from.id
      if msg.text:match("^y$") and redis:get(hash) == "waite" then
	  redis:set(hash, "ok")
	elseif msg.text:match("^n$") and redis:get(hash) == "waite" then
	send_large_msg(get_receiver(msg), "canceled")
	  redis:del(hash, true)

      end
    end
	local hash = 'kick:'..msg.to.id..':'..msg.from.id
	 if redis:get(hash) then
        if redis:get(hash) == "ok" then
         channel_kick("channel#id"..msg.to.id, "user#id"..msg.from.id, ok_cb, false)
         return '❌this user ('..msg.to.title..') kicked'
        end
      end
    end

return {
  patterns = {
  "kickme",
  "^y$",
  "^n$"
  },
  run = run,
}
