// DEPENDENCE: ../../../module1 ../../../module2 ../../../module3
// EXEC: %compiler %cmp_opt -c ./module1/src/p1/*.cj -module-name module1 -o module1/p1.%middle  && %copycharjs module1
// EXEC: %compiler %cmp_opt -c ./module2/src/p1/*.cj -module-name module2 -o module2/p1.%middle  && %copycharjs module2
// EXEC-PIPE-1: %compiler %cmp_opt module1/p1.%middle module2/p1.%middle %f -o %output 2>&1 | compare %f

from module1 import p1.C // OK
from module2 import p1.C // OK
func main() {
    var a = C() // EXPECTED: regex-auto can not distinguish which class C is used
    var b = p1.C() // EXPECTED: regex-auto package name 'p1' is conflicted with other imported package name, please use 'as' to eliminate conflict
    return 0
}
