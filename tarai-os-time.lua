function tarai(x, y, z)
    if x > y then
        return tarai( tarai(x-1, y, z), tarai(y-1, z, x), tarai(z-1, x, y) )
    else
        return y
    end
end

local n, i = 10, 0
local ans
local t1 = os.time()
while i < n do
    ans = tarai(14, 7, 0)
    i = i + 1
end
local t2 = os.time()
local diff = os.difftime(t2, t1)
print(string.format("elapsed=%.1f, ans=%d", diff / n, ans))
