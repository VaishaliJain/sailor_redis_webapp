local redis = require "redis"
local sailor = require "sailor"

local board = {}
local client = nil

local function redis_connect()
  if client==nil then
  	client = redis.connect('127.0.0.1', 6379)
  end
end

local function redis_insert(score,name)
	redis_connect()
	client:zadd('board',score,name)
end

local function redis_retreive(start,last)
  redis_connect()
  local t = client:zrevrange('board',start,last)
  for i  = 1, #t do
  	local score = client:zscore('board',t[i])
  	local name = t[i]
  	t[i] = {}
  	t[i]['name'] = name
  	t[i]['score'] = score
  end
  return t
end

function board.index(page)
  local Board = sailor.model("user")
  local board = Board:find_all()
  for i = 1, #board do
  	redis_insert(board[i].score,board[i].name)
  end
  local t = redis_retreive(0,10)

  page:render('index', { top = t })
end

return board
