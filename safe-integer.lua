local max_safe_integer = 9007199254740991
local min_safe_integer = -9007199254740991

local w = max_safe_integer
local x = max_safe_integer + 1
local y = max_safe_integer + 2
print(string.format('w=%d, x=%d, w==x: %s', w, x, w == x))
print(string.format('x=%d, y=%d, x==y: %s', x, y, x == y))

local w2 = min_safe_integer
local x2 = min_safe_integer - 1
local y2 = min_safe_integer - 2
print(string.format('w2=%d, x2=%d, w2==x2: %s', w2, x2, w2 == x2))
print(string.format('x2=%d, y2=%d, x2==y2: %s', x2, y2, x2 == y2))

function check_safe_integer(v)
    if v < min_safe_integer or v > max_safe_integer then
        print(string.format("number %g is not a safe integer", v))
    end
end

check_safe_integer(max_safe_integer)
check_safe_integer(max_safe_integer + 1)
check_safe_integer(min_safe_integer)
check_safe_integer(min_safe_integer - 1)
