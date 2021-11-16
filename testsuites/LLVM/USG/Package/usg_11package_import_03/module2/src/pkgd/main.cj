// DEPENDENCE: ../../../module1 ../../../module2 
// EXEC: %compiler %cmp_opt -c ./module1/src/p1/*.cj -module-name module1 -o module1/p1.%middle  && %copycharjs module1
// EXEC: %compiler %cmp_opt -c ./module2/src/p1/*.cj -module-name module2 -o module2/p1.%middle  && %copycharjs module2
// EXEC: %compiler %cmp_opt -c ./module2/src/pkgc/*.cj -o pkgc.%middle  && %copycharjs module2
// EXEC-PIPE-1: %compiler %cmp_opt module1/p1.%middle module2/p1.%middle  pkgc.%middle %f -o %output 2>&1| compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

package pkgd

from module1 import p1.C
from module2 import p1.C
import pkgc.C

func main() {
    C() // EXPECTED:regex error.*?can not distinguish which class C is used

    p1.C() // EXPECTED:regex error.*?package name 'p1' is conflicted with other imported package name, please use 'as' to eliminate conflict.
}
