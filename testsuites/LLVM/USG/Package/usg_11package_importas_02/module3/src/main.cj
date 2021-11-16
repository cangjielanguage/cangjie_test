// DEPENDENCE: ../../module1 ../../module2 ../../module3
// EXEC: %compiler %cmp_opt -c ./module1/src/p1/*.cj -module-name module1 -o module1/p1.%middle  && %copycharjs module1
// EXEC: %compiler %cmp_opt -c ./module2/src/p1/*.cj -module-name module2 -o module2/p1.%middle  && %copycharjs module2
// EXEC: %compiler %cmp_opt -c ./module3/src/p2/*.cj -o p2.%middle
// EXEC-PIPE-1: %compiler %cmp_opt module1/p1.%middle module2/p1.%middle p2.%middle %f -o %output 2>&1| compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

from module1 import p1.* as A.*
from module2 import p1.* as B.*
//import p2.f1 as a
import p2.f1 as f // EXPECTED:regex error.*alias name 'f' is conflicted with imported declaration name.

func f(a: Int32) {} // EXPECTED:regex error.*function 'f' has overload conflicts

func main() {
    f(1)

    p1.f1() // EXPECTED:regex error.*?undeclared identifier 'p1'

    p2.f1() // EXPECTED:regex error.*?'f1' is not a member of package 'p2'
}
