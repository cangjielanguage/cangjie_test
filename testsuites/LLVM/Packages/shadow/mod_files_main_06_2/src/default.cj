// DEPENDENCE: ../mod1
// EXEC: %compiler %cmp_opt -c ./mod1/src/p1/*.cj -module-name mod1 -o mod1/a.%middle  && %copycharjs mod1
// EXEC: %compiler %cmp_opt -c ./mod1/src/*.cj mod1/a.%middle -module-name mod1 -o mod1/pkgDefault.%middle  && %copycharjs mod1
// EXEC: %ls mod1 2>&1 | compare %f
// ASSERT: scan pkgDefault.cjo

// When using package compilation method, the package under src can be exported and imported. But main redefinition error
// will be reported when linking the .o file of different package under src, even though the package name under src is not default.

from mod1 import p1.*
from mod1 import pkgDefault.*

func main(): Int64 {
    var a = foo(Int8(1))
    if ( a != 11 ) {
        return 1
    }
    return 0
}