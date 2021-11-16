// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output  %run_args

import ast.*

func main(){
    var T1 : Token = Token(0)
    var T2 : Token = Token(1)
    var res1 = T1 + T2
    if (res1.size() != 2) {
        return 1
    }
    return 0
}
