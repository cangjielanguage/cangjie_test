// DEPENDENCE:  pkgb
// EXEC: %compiler %cmp_opt -c pkgb/*.cj -o pkgb.%middle
// EXEC: %compiler %cmp_opt %f pkgb.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgb.Boo2 as class06

func main(): Int64 {

    if ( foo<class06>() != 2 ){
        return 4
    }
    return 0
}

func foo<T>() where T<: class06{return T.b2}
