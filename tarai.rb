def tak(x, y, z)
  if x > y then
    tak(tak(x-1, y, z), tak(y-1, z, x), tak(z-1, x, y))
  else
    y
  end
end

start = Time.now
puts tak(14, 7, 0)
puts Time.now - start
