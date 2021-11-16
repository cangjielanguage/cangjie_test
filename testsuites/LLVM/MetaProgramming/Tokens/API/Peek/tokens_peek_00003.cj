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
    it.next()
    var res1 = match (it.peek()) { // return Token(2), which is l_paren
        case Some(obj) => obj
        case $None => Token()
    }
    var ret1 = match (res1.kind) {
        case $LPAREN => "l_paren"
        case _ => "mismatch"
    }
    if (ret1 != "l_paren") {
        return 2
    }
    return 0
}
