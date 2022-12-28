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

function tarai(x, y, z)
    if x > y then
        return tarai( tarai(x-1, y, z), tarai(y-1, z, x), tarai(z-1, x, y) )
    else
        return y
    end
end

-- See
-- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_SAFE_INTEGER
-- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MIN_SAFE_INTEGER
local max_safe_integer = 9007199254740991
local min_safe_integer = -9007199254740991

function check_safe_integer(v)
    if v < min_safe_integer or v > max_safe_integer then
        print(string.format("number %g is not a safe integer", v))
        os.exit(1)
    end
end

function timespecdiffsec(t, u)
    check_safe_integer(tonumber(t.tv_sec))
    check_safe_integer(tonumber(t.tv_nsec))
    check_safe_integer(tonumber(u.tv_sec))
    check_safe_integer(tonumber(u.tv_nsec))

    local sec = tonumber(t.tv_sec) - tonumber(u.tv_sec)
    local nsec = tonumber(t.tv_nsec) - tonumber(u.tv_nsec)
    if nsec < 0 then
        sec = sec - 1
        nsec = nsec + 1000000000
    end
    return sec + nsec / 1000000000
end

local t1 = ffi.new("struct timespec[1]")
local t2 = ffi.new("struct timespec[1]")

C.clock_gettime(CLOCK_REALTIME, t1[0])
local ans = tarai(14, 7, 0)
C.clock_gettime(CLOCK_REALTIME, t2[0])

local delta = timespecdiffsec(t2[0], t1[0])
print(string.format("%f %d", delta, ans))
