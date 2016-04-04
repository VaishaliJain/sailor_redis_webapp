local val = require "valua"
local book = {}

book.attributes = {
  { id = "safe" },
  { title = val:new().not_empty().len(1, 20) }
}

book.db = {
  key = "id",
  table = "book"
}

return book
