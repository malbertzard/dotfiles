require("luasnip.loaders.from_lua").lazy_load()
local env = snip_env

return {
  env.parse("name", "Mathis Albertzard"),
  env.parse("gmail", "malbertzard@gmail.com"),
  env.parse("mfg", "Mit freundlichen Grüßen\nMathis Albertzard"),
  env.parse("sehrg", "Sehr geehrte Damen und Herren, \n\n"),
  env.s("date", env.p(os.date, "%Y-%m-%d")),
  env.s("time", env.p(os.date, "%H:%M")),
  env.s("htime", env.p(os.date, "%Y-%m-%dT%H:%M:%S+10:00")),
}
