// DEPENDENCE: ../module1 ../module2
// EXEC: %compiler %cmp_opt -c ./module1/src/p1/*.cj -module-name module1 -o module1/p1.%middle  && %copycharjs module1
// EXEC: %compiler %cmp_opt -c ./module2/src/p1/*.cj -module-name module2 -o module2/p1.%middle  && %copycharjs module2
// EXEC: %compiler %cmp_opt module1/p1.%middle module2/p1.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

from module1 import p1.* as A.*
from module2 import p1.* as B.*

func main(): Int64 {
    A.f1()
    B.f2()
    return 0
}
