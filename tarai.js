function tarai(x, y, z) {
  if(x > y) {
    return tarai( tarai(x-1, y, z), tarai(y-1, z, x), tarai(z-1, x, y) );
  } else {
    return y;
  }
}

var start = (new Date()).getTime();
var ans = tarai(14, 7, 0);
console.log(((new Date()).getTime() - start) / 1000, ans)
