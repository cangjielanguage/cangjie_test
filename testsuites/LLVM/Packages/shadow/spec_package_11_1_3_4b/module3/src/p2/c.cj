// DEPENDENCE: ../../../module1 ../../../module2 ../../../module3
// EXEC: %compiler %cmp_opt -c ./module1/src/p1/*.cj -module-name module1 -o module1/p1.%middle  && %copycharjs module1
// EXEC: %compiler %cmp_opt -c ./module2/src/p1/*.cj -module-name module2 -o module2/p1.%middle  && %copycharjs module2
// EXEC: %compiler %cmp_opt module1/p1.%middle module2/p1.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

from module1 import p1.C
from module2 import p1.C

func main() {
    var c = module2.p1.C()
    if ( c.c22 != 2 ){
        return 1
    }
    return 0
}