// DEPENDENCE: pkg
// EXEC: %compiler %cmp_opt -c pkg/a.cj -o a.%middle
// EXEC: %compiler %cmp_opt %f a.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkg.res
var map01 =   res
func main(): Int64 {
    if ( map01.size() == 3 ){
        return 0
    }
    return 1
}
