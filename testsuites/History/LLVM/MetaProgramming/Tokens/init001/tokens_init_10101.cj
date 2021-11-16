// EXEC: echo "ast=%libdir/ast/ast.cjo" > ast.cfg
// EXEC: %compiler -i ast.cfg  %use_ast %f -o %output
// EXEC: %run %run_opt %output  %run_args

import ast.*

var id : UInt16 = 102

func check(T:Tokens, index: Int64): Int64{
    var t = T.get(0)
    if (t.value != "this") {
        return 1 + index
    }
    if (t.pos.fileID != 0) {
        return 2 + index
    }
    if (t.pos.line != 0) {
        return 3 + index
    }
    if (t.pos.column != 0) {
        return 4 + index
    }
    var res : UInt16*String = match (t.kind) {
        case $TokenKind(x,y,_,_) => (x,y)
        case _ => (65535,"")
    }
    if (res[0] != id) {
        return 5 + index
    }
    var expected = "this"
    if (res[1] != expected) {
        return 6 + index
    }
    return 0
}

func main(){
    var t1 = Token(id)
    var T1 = Tokens(@{t1})

    var t2  = Token(TokenKind.Get(id))
    var T2 = Tokens(@{t2})

    var t3 = Token(id, "this")
    var T3 = Tokens(@{t3})

    var t4  = Token(TokenKind.Get(id), "this")
    var T4 = Tokens(@{t4})

    var t5 = Token(id, "this", Position())
    var T5 = Tokens(@{t5})

    var t6  = Token(TokenKind.Get(id), "this", Position())
    var T6 = Tokens(@{t6})

    var t7 = Token(id, "this", 0, 0, 0)
    var T7 = Tokens(@{t7})

    var t8  = Token(TokenKind.Get(id), "this", 0, 0, 0)
    var T8 = Tokens(@{t8})


    var res1 = check(T1,10)
    if (res1 != 0) {return res1}
    var res2 = check(T2,20)
    if (res2 != 0) {return res2}
    var res3 = check(T3,30)
    if (res3 != 0) {return res3}
    var res4 = check(T4,40)
    if (res4 != 0) {return res4}
    var res5 = check(T5,50)
    if (res5 != 0) {return res5}
    var res6 = check(T6,60)
    if (res6 != 0) {return res6}
    var res7 = check(T7,70)
    if (res7 != 0) {return res7}
    var res8 = check(T8,80)
    if (res8 != 0) {return res8}

    return 0
}
