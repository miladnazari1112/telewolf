local datebase = {
   "انلاینم :) @Telewolf_ch",
  "ریدی داش آنلاینم 😐❤️ ",
  "خفه شۅ عنچهره توهین نکن 😐❤️ ",
  }
local function run(msg, matches) 
 send_document(get_receiver(msg), "/home/root/teleseed/data/sticker.webp", ok_cb, false)
return datebase[math.random(#datebase)]
end
return {
  patterns = {
    "^[/#+×!$]([Oo][Nn][Ll][Ii][Nn][Ee]?)",
    "^ping",
   "^[!#/+]([Pp][Ii][Nn][Gg])",
  },
  run = run
}
