// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output  %run_args

import ast.*

var id : UInt16 = 140

func main(){
    var T : Tokens = Tokens(@{Token(id)})
    var it = T.iterator()
    it.next()
    if (it.seeing(Token(id).kind)) {
        return 0
    }
    return 1
}
