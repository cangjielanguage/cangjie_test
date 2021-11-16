// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output  %run_args

import ast.*

var id : UInt16 = 0

func main(){
    var T : Tokens = Tokens(@{Token(id)})
    var it = T.iterator()
    it.next()
    if (it.seeing(Token(id+1).kind)) {
        return 1
    }
    return 0
}
