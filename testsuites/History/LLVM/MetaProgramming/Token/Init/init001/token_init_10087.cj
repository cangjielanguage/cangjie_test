// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output  %run_args

from ast import ast.*

var id : UInt16 = 88

func check(t:Token, index: Int64): Int64{
    if (t.value != "import") {
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
    var expected = "import"
    if (res[1] != expected) {
        return 6 + index
    }
    return 0
}

func main(){
    var t1 = Token(id)
    var t2  = Token(TokenKind.Get(id))
    var t3 = Token(id, "import")
    var t4  = Token(TokenKind.Get(id), "import")
    var t5 = Token(id, "import", Position())
    var t6  = Token(TokenKind.Get(id), "import", Position())
    var t7 = Token(id, "import", 0, 0, 0)
    var t8  = Token(TokenKind.Get(id), "import", 0, 0, 0)

    var res1 = check(t1,10)
    if (res1 != 0) {return res1}
    var res2 = check(t2,20)
    if (res2 != 0) {return res2}
    var res3 = check(t3,30)
    if (res3 != 0) {return res3}
    var res4 = check(t4,40)
    if (res4 != 0) {return res4}
    var res5 = check(t5,50)
    if (res5 != 0) {return res5}
    var res6 = check(t6,60)
    if (res6 != 0) {return res6}
    var res7 = check(t7,70)
    if (res7 != 0) {return res7}
    var res8 = check(t8,80)
    if (res8 != 0) {return res8}

    return 0
}
