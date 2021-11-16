#include <unistd.h>
#include <sys/types.h>
#include <stdio.h>
 
int main()
{
    gid_t list[100];
    int x, i;
    x = getgroups(0, list);
    getgroups(x, list);
    for(int i = 0; i < x; i++)
        printf("%d:%d\n", i, list[i]);
    return 0;

}
