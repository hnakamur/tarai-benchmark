local ffi = require "ffi"
local C = ffi.C

ffi.cdef[[
    typedef int clockid_t;
    typedef int64_t time_t;

    struct timespec {
        time_t   tv_sec;        /* seconds */
        long     tv_nsec;       /* nanoseconds */
    };

    int clock_gettime(clockid_t clockid, struct timespec *tp);
]]

local CLOCK_REALTIME = 0

function timespecdiffsec(t, u)
    local sec = tonumber(t.tv_sec) - tonumber(u.tv_sec)
    local nsec = tonumber(t.tv_nsec) - tonumber(u.tv_nsec)
    if nsec < 0 then
        sec = sec - 1
        nsec = nsec + 1000000000
    end
    return sec + nsec / 1000000000
end

local called = 0
function tarai(x, y, z)
    called = called + 1
    if x > y then
        return tarai( tarai(x-1, y, z), tarai(y-1, z, x), tarai(z-1, x, y) )
    else
        return y
    end
end

local t1 = ffi.new("struct timespec[1]")
local t2 = ffi.new("struct timespec[1]")

C.clock_gettime(CLOCK_REALTIME, t1[0])
local ans = tarai(14, 7, 0)
C.clock_gettime(CLOCK_REALTIME, t2[0])

local delta = timespecdiffsec(t2[0], t1[0])
print(string.format("elapsed=%g ans=%d called=%d", delta, ans, called))
