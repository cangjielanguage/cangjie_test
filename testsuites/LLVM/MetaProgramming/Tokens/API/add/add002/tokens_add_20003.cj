// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output  %run_args

import ast.*

func main(){
    var T1 : Tokens = Tokens(Array<Token>(5, Token(0)))
    var T2 : Token = Token(1)
    var res1 = T1 + T2 // 000001
    var res2 = T2 + T1 // 100000
    if (res1.size() != 6 || res2.size() != 6) {
        return 1
    }
    var t1 = res1.get(5) // 1
    var t2 = res2.get(5) // 0
    var k1 = (t1 == Token(1))
    var k2 = (t2 == Token(0))
    if (!k1 || !k2) {
        return 2
    }
    return 0
}
