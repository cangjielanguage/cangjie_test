// DEPENDENCE: ../../module1 ../../module2 ../../module3
// EXEC: %compiler %cmp_opt -c ./module1/src/p1/*.cj -module-name module1 -o module1/p1.%middle  && %copycharjs module1
// EXEC: %compiler %cmp_opt -c ./module2/src/p1/*.cj -module-name module2 -o module2/p1.%middle  && %copycharjs module2
// EXEC: %compiler %cmp_opt -c ./module3/src/p2/*.cj -o p2.%middle
// EXEC-PIPE-1: %compiler %cmp_opt module1/p1.%middle module2/p1.%middle p2.%middle %f -o %output 2>&1 | compare %f

from module1 import p1.* as A.*
from module2 import p1.* as B.*
import p2.foo as f2

func main(): Int64 {
    A.f1() // EXPECTED: regex-not error
    B.f2() // EXPECTED: regex-not error
    p1.f1() // EXPECTED: regex error.*undeclared identifier 'p1'
    module1.A.f1() // EXPECTED: regex-not error
    f2() // EXPECTED: regex-not error
    foo() // EXPECTED: regex error.*undeclared identifier 'foo'
    p2.foo() // EXPECTED: regex error.*'foo' is not a member of package 'p2'
    return 0
}
