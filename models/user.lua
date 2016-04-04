local val = require "valua"
local user = {}
 
user.attributes = {
  { id = "safe" },
  { name = val:new().not_empty() },
  { score = val:new().not_empty() }
}
 
user.db = {
  key = "id",
  table = "users"
}
 
return user