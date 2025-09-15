

#include <stdio.h>
#include <time.h>

int main(int argc, char **argv){
  printf("ticksSinceStart => %lu\n" , clock());
  printf("time => %lu\n" , time(NULL));
  printf("ulong has size %lu\n",sizeof(long unsigned int));
  printf("long has size %lu\n",sizeof(long int));
  printf("unsigned int has size %lu\n",sizeof(unsigned int));
  printf("signed int has size %lu\n",sizeof(int));

  printf("clock_t has size %lu\n",sizeof(clock_t));  
  return 0;
}





