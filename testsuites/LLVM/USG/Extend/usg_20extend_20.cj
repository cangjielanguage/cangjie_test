// DEPENDENCE: A.cj B.cj
// EXEC: %compiler %cmp_opt -c A.cj -o a.%middle
// EXEC: %compiler %cmp_opt -c B.cj a.%middle -o b.%middle
// EXEC: %compiler %cmp_opt %n.cj a.%middle b.%middle -o %output 2>&1 | compare %f

import A.*

func main() {
    let a = Foo()
    a.h()   // EXPECTED: regex is not a member of class
    return 0
}
