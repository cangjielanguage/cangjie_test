// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output  %run_args

import ast.*

func main(){
    var T1 = Tokens(@{
                    Token(1)
                    })
    var s1 = T1.size()
    var it = T1.iterator()
    it.next()
    it.peek()
    var s2 = T1.size()
    if (s1 != s2) {
        return 1
    }
    return 0
}
