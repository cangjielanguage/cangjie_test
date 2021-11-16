// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output
// EXEC: %run %run_opt %output  %run_args

import test.*

func main(){
    @M(match (1) {
    case x : Int64 => 1
    case None(Int64) => 2
    case a => 3
    case _ if (true) => 4
    })
    if (flag) {
        return 0
    }else{
        return 1
    }
}

