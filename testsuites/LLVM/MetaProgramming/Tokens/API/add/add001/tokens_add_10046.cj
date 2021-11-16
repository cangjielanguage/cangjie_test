// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output  %run_args

import ast.*

var id : UInt16 = 45

func check(a:Token, b: Token):Int64 {
    if (a.value != "test") {
        return 2
    }
    if (a == b) {
        return 0
    }
    return 3
}

func main(){
    var T1 : Tokens = Tokens(@{Token(id,"test",1,2,3)})
    var t1 = Token()
    var res1 = T1 + t1
    var res2 = t1 + T1
    if (res1.size() != 2 || res2.size() != 2) {
        return 1
    }
    return check(res1.get(0),res2.get(1))
}
