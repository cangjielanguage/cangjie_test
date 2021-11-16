// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output  %run_args

import ast.*

func main(){
    var T1 : Tokens = Tokens()
    var T2 : Tokens = Tokens()
    var res1 = T1 + T2
    var res2 = T2 + T1
    if (res1.size() != 0 || res2.size() != 0) {
        return 1
    }
    return 0
}
