local sailor = require "sailor"

local list = {}

function list.index(page)
  local Book = sailor.model("book")
  local books = Book:find_all()
  page:render('index', { books = books })
end

return list