#include <stdio.h>
#include <time.h>

int tarai(int x, int y, int z){
   if (x > y){
      return tarai( tarai(x-1, y, z), tarai(y-1, z, x), tarai(z-1, x, y) );
   } else {
      return y;
   }
}

int main(void){
   struct timespec time1, time2;
   float delta;

   clock_gettime(CLOCK_REALTIME, &time1);
   int ans = tarai(14, 7, 0);
   clock_gettime(CLOCK_REALTIME, &time2);

   delta = time2.tv_sec - time1.tv_sec + (float)(time2.tv_nsec - time1.tv_nsec) / 1000000000;
   printf("%f %d\n", delta, ans);
   return 0;
}
