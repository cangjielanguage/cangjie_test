// DEPENDENCE: A.cj
// EXEC: %compiler %cmp_opt -c A.cj -o a.%middle
// EXEC: %compiler %cmp_opt %f a.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import A.*

func main() {
    let a = Foo()
    a.f() // ok
    return 0
}
