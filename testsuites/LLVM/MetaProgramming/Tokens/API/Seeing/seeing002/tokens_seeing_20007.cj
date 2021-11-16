// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output  %run_args

import ast.*


func main(){
    var T : Tokens = Tokens(@{Token(1)})
    var s1 = T.size()
    var it = T.iterator()
    it.next()
    it.seeing(Token(1).kind)
    var s2 = T.size()
    if (s1 != s2) {
        return 1
    }
    return 0
}
