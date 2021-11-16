// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output  %run_args

import ast.*

func main(){
    var T1 = Tokens(@{
                    Token(1)
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
    it.next()
    it.next()
    var res1 = match (it.peek()) {
        case Some(obj) => obj
        case $None => Token()
    }
    var ret1 = match (res1.kind) {
        case $END => "end"
        case _ => "mismatch"
    }
    if (ret1 != "end") {
        return 1
    }
    return 0
}
