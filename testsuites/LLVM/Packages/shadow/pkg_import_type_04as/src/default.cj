// DEPENDENCE: pkga pkgb
// EXEC: %compiler %cmp_opt -c pkga/a.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt -c pkgb/*.cj -o pkgb.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle pkgb.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.* as alias1.*
import pkgb.*
import pkgb.Boo1 as alias2

func main(): Int64 {
    var m1:alias1.Aoo = alias1.Aoo()
    var m2:alias2 = alias2()
    if ( m1.a != 1 ){
        return 1
    }
    if ( alias2().b1 != 1 ){
        return 2
    }
    if ( pkgb.Boo2.b2 != 2 ){
        return 3
    }
    if ( foo<Boo2>() != 2 ){
        return 4
    }
    return 0
}

func foo<T>() where T<: pkgb.Boo2{return T.b2}
func goo<T>() where T<: Aoo{return Aoo().a}
extend Aoo{}
extend alias2{}