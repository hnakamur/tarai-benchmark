-- See
-- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_SAFE_INTEGER
-- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MIN_SAFE_INTEGER
local max_safe_integer = 9007199254740991
local min_safe_integer = -9007199254740991

function check_safe_integer(v)
    if v < min_safe_integer or v > max_safe_integer then
        print(string.format("number %g is not a safe integer", v))
    end
end

local x = max_safe_integer + 1
local y = max_safe_integer + 2
print(string.format('x=%d, y=%d, x==y: %s', x, y, x == y))

local x2 = min_safe_integer - 1
local y2 = min_safe_integer - 2
print(string.format('x2=%d, y2=%d, x2==y2: %s', x2, y2, x2 == y2))

check_safe_integer(max_safe_integer)
check_safe_integer(max_safe_integer + 1)
check_safe_integer(min_safe_integer)
check_safe_integer(min_safe_integer - 1)
