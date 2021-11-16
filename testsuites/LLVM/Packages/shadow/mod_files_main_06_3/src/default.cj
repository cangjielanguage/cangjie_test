// DEPENDENCE: ../mod1
// EXEC: %compiler %cmp_opt %mod_opt ./mod1 -module-name mod1 -o ./mod1 && %copycharjs mod1
// EXEC: %ls ./mod1 2>&1 | compare %f
// ASSERT: scan-not default.cjo
// ASSERT: scan-not pkgDefault.cjo 

// When using module compilation method, the package under src cannot be exported and imported.

from mod1 import p1.*
from mod1 import pkgDefault.*

func main(): Int64 {
    var a = foo(Int8(1))
    if ( a != 11 ) {
        return 1
    }
    return 0
}
