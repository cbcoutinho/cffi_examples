#include <stdio.h>

extern void* func2(void* arg);

void func()
{
  int arg = 42;
  int* ptr;

  ptr = &arg;

  printf("before func2 - value: : %d\n", *ptr);
  printf("before func2 - address: %p\n",  ptr);
  ptr = func2(ptr);
  printf("after func2 - address: %p\n",  ptr);
  printf("after func2 - value of arg: %d\n", arg);
}
