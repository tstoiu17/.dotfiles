-- template LazySpec
-- return {
--     ##### setup (won't really change this) #####
--     "github_username/repo"
--     branch = "string",
--     tag = "string",
--     commit = "string",
--     version = "string",
--     pin = "string",
--     submodules = true,
--     dependencies = { LazySpec[] },
--     ##### lazy loading settings #####
--     priority = false,
--     ##### lazy loading triggers #####
--     event = {},
--     cmd = {},
--     ft = {},
--     keys = {},
--     ##### config #####
--     init = function()
--     build = function() or "shell/vim command(s)"
--     config = {},
--     keys = {},
--     opts = {},
--     ##### misc (probably wont use these) #####
--     main = "name of module (should get auto determined)",
--     module = false,
--     optional = false,
-- }
return {}