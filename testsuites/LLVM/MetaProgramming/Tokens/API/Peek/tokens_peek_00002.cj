// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output  %run_args

import ast.*

func main(){
    var T1 = Tokens(@{
                    Token(1),
                    Token(2),
                    Token(3),
                    Token(4),
                    Token(5)
                    })
    var it = T1.iterator()
    it.next()
    var res = match (it.peek()) { // return Token(1), which is comma
        case Some(obj) => obj
        case $None => Token()
    }
    var ret = match (res.kind) {
        case $COMMA => "comma"
        case _ => "mismatch"
    }
    if (ret != "comma") {
        return 1
    }
    return 0
}
