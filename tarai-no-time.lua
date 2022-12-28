function tarai(x, y, z)
    if x > y then
        return tarai( tarai(x-1, y, z), tarai(y-1, z, x), tarai(z-1, x, y) )
    else
        return y
    end
end

local ans = tarai(14, 7, 0)
print(string.format("ans=%d", ans))
