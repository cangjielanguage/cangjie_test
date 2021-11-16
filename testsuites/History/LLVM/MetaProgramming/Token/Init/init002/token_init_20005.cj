// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output  %run_args

from ast import ast.*

var id : UInt16 = 150 // INTEGER_LITERAL is 150.

func check(t:Token, index: Int64): Int64{
    if (t.value != "1_2_3") {
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
    var res : UInt16*String*String = match (t.kind) {
        case $TokenKind(x,y,z,_) => (x,y,z)
        case $UnknownKind => (65535,"unknown","unknown")
        case _ => (0,"","")
    }
    if (res[0] != id) {
        return 5 + index
    }
    var expected_name = "integer_literal"
    if (res[1] != expected_name) {
        return 6 + index
    }
    var expected_value = ""
    if (res[2] != expected_value) {
        return 7 + index
    }
    return 0
}

func main(){
    // init literal with value "1"
    var value = "1_2_3"
    var t3 = Token(id, value)
    var t4  = Token(TokenKind.Get(id), value)
    var t5 = Token(id, value, Position())
    var t6  = Token(TokenKind.Get(id), value, Position())
    var t7 = Token(id, value, 0, 0, 0)
    var t8  = Token(TokenKind.Get(id), value, 0, 0, 0)

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
