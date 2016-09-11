local function run(msg, matches)
  local data = load_data(_config.moderation.data)
  if matches[1] == "setnerkh" and matches[2] and is_admin1(msg) then
  data['nerkh_text'] = matches[2]
    save_data(_config.moderation.data, data)
  return "#Done :| "
end

if matches[1] == "clearnerkh" and is_admin1(msg) then
 data['nerkh_text'] = nil
  return "hale :|"
end

if matches[1] == "nerkh" and msg.to.type == "channel" then
 if data['nerkh_text'] then
 local help_text = data['help_text']
   return "\n"..help_text
 else 
  return "موجود نیست \nبا دستور زیر ست کنید\n/setnerkh <text>"
     end
  end
end

return {
description = "Best Help Plugin",
usage = {
    "/sethelp <help_text> : Set Text Help",
    "/clearhelp : Clean The Last Help Text",
    "/help : Get Help Text"
},
    patterns = {
        "^[/!#](setnerkh) (.*)$",
        "^[/!#](clearnerkh)$",
        "^[#/!](nerkh)$"
    },
    run = run
}
