// DEPENDENCE: ../mod1
// EXEC: %compiler %cmp_opt -c ./mod1/src/p1/*.cj -module-name mod1 -o mod1/a.%middle  && %copycharjs mod1
// EXEC: %compiler %cmp_opt -c ./mod1/src/*.cj mod1/a.%middle -module-name mod1 -o mod1/default.%middle  && %copycharjs mod1
// EXEC: %ls mod1 2>&1 | compare %f
// ASSERT: scan default.cjo

from mod1 import p1.*
from mod1 import default.*

func main(): Int64 {
    var a = foo(Int8(1))
    if ( a != 11 ) {
        return 1
    }
    return 0
}