// DEPENDENCE: ../mod1
// EXEC: %compiler %cmp_opt -c ./mod1/src/p1/*.cj -module-name mod1 -o mod1/a.%middle  && %copycharjs mod1
// EXEC: %compiler %cmp_opt -c ./mod1/src/*.cj mod1/a.%middle -module-name mod1 -o mod1/pkg.%middle  && %copycharjs mod1
// EXEC-PIPE-1: %compiler %cmp_opt mod1/a.%middle  mod1/pkg.%middle  %f -o %output 2>&1 | compare %f
// ASSERT: regex-auto multiple definition of `main'

from mod1 import p1.*
from mod1 import pkg.*

func main(): Int64 {
    var a = foo(Int8(1))
    if ( a != 11 ) {
        return 1
    }
    return 0
}