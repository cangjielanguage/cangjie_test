// DEPENDENCE: pkga pkgb
// EXEC: %compiler %cmp_opt -c pkga/a.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt -c pkgb/*.cj -o pkgb.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle pkgb.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.*,pkgb.*

func main(): Int64 {
    var m1:Aoo = Aoo()
    var m2:pkgb.Boo1 = Boo1()
    if ( m1.aa() != 1 ){
        return 1
    }
    if ( Boo1().bb1() != 1 ){
        return 2
    }
    if ( pkgb.Boo2.bb2() != 2 ){
        return 3
    }
    if ( foo<Boo2>() != 2 ){
        return 4
    }
    return 0
}

func foo<T>() where T<: pkgb.Boo2{return T.bb2()}
func goo<T>() where T<: Aoo{return Aoo().aa()}
extend Aoo{}
extend pkgb.Boo1{}