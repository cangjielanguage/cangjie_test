// DEPENDENCE: ../../../module1 ../../../module2 
// EXEC: %compiler %cmp_opt -c ./module1/src/p1/*.cj -module-name module1 -o module1/p1.%middle  && %copycharjs module1
// EXEC: %compiler %cmp_opt -c ./module2/src/p1/*.cj -module-name module2 -o module2/p1.%middle  && %copycharjs module2
// EXEC: %compiler %cmp_opt -c ./module2/src/pkgc/*.cj -o pkgc.%middle  && %copycharjs module2
// EXEC: %compiler %cmp_opt module1/p1.%middle module2/p1.%middle  pkgc.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

package pkgd

from module1 import p1.C
from module2 import p1.C
import pkgc.C

func main() {
    pkgc.C() // OK.
    module1.p1.C() // OK.
    module2.p1.C() // OK.
    if(pkgc.C.c31==2 && module1.p1.C().c12==1 && module2.p1.C().c22==2){
        return 0
    }else{
        return 1
    }
}
