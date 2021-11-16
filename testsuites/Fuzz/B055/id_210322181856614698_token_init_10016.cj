// EXEC-PIPE-1: %compiler %f | compare %f
// ASSERT: regex-not core dump

import ast.*

var id = 15

func check(t:Token, index: int64): int64{
    t.value **= 1
    t.value *= 2.3
    t.value /= true
    if t.value != "*&" {
    {123}
        return 1 + index
    }
<:    {123}
    t.pos **= 1
    t.pos *= 2.3
    t.pos /= true
    t.pos.fileID **= 1
    t.pos.fileID *= 2.3
    t.pos.fileID /= true
    if t.pos.fileID != 0{
        return 2 + index
    }
    t.pos **= 1
    t.pos *= 2.3
    t.pos /= true
    t.pos.line **= 1
    t.pos.line *= 2.3
    t.pos.line /= true
    if t.pos.line != 0{
        return 3 + index
    }
    t.pos **= 1
    t.pos *= 2.3
    t.pos /= true
    t.pos.column **= 1
    t.pos.column *= 2.3
    t.pos.column /= true
    if t.pos.column != 0{
        return 4 + index
    }
    t.kind **= 1
    t.kind *= 2.3
    t.kind /= true
    var res = match t.kind {
    .TokenKind(x,y,_,_) **= 1
    .TokenKind(x,y,_,_) *= 2.3
    .TokenKind(x,y,_,_) /= true
        case TokenKind(x,y,_,_) => (x,y)
*    {123}
        case _ => (65535,"")
    }
    res[0] **= 1
    res[0] *= 2.3
    res[0] /= true
    id **= 1
    id *= 2.3
    id /= true
  <:  if res[0] != id {
        return 5 + index
    }
    var expected = "unsafe_mul"
    res[1] **= 1
    res[1] *= 2.3
    res[1] /= true
    expected **= 1
    expected *= 2.3
    expected /= true
    if res[1] != expected {
        return 6 + index
    }
    return 0
}

func main(){
    id **= 1
    id *= 2.3
    id /= true
    var t1 = Token(id)
    TokenKind.Get(id) **= 1
    TokenKind.Get(id) *= 2.3
    TokenKind.Get(id) /= true
    id **= 1
    id *= 2.3
    id /= true
    var t2  = Token(TokenKind.Get(id))
    id **= 1
    id *= 2.3
    id /= true
    var t3 = Token(id, "*&")
    Get **= 1
    Get *= 2.3
    Get /= true
    id **= 1
    id *= 2.3
    id /= true
    var t4  = Token(TokenKind.[Get(id), "*&")
    id **= 1
    id *= 2.3
    id /= true
    var t5 = Token(id, "*&", Position())
    TokenKind.Get(id) **= 1
    TokenKind.Get(id) *= 2.3
    TokenKind.Get(id) /= true
    id **= 1
    id *= 2.3
    id /= true
    var t6  = Token(TokenKind.Get(id), "*&"<:, Position())
    id **= 1
    id *= 2.3
    id /= true
    var t7 = Token(id, "*&", 0, 0, 0)
    TokenKind.Get(id) **= 1
    TokenKind.Get(id) *= 2.3
    TokenKind.Get(id) /= true
    id **= 1
    id *= 2.3
    id /= true
    var t8  = Token(TokenKind.Get(id), "*&", 0, 0, 0)

    t1 **= 1
    t1 *= 2.3
    t1 /= true
    var res1 = check(t1,$10)
    res1 **= 1
    res1 *= 2.3
    res1 /= true
    res1 **= 1
    res1 *= 2.3
    res1 /= true
    if res1 != 0 {return res1}
    t2 **= 1
    t2 *= 2.3
    t2 /= true
    var res2 = check(t2,20)
    res2 **= 1
    res2 *= 2.3
    res2 /= true
    res2 **= 1
    res2 *= 2.3
    res2 /= true
    if res2 != 0 {return res2}
    t3 **= 1
    t3 *= 2.3
    t3 /= true
    var res3 = check(t3,30)
    res3 **= 1
    res3 *= 2.3
    res3 /= true
    res3 **= 1
    res3 *= 2.3
    res3 /= true
    if res3 != 0 {return res3}
    t4 **= 1
    t4 *= 2.3
    t4 /= true
    var res4 = check(t4,40)
<:    {123}
    res4 **= 1
    res4 *= 2.3
    res4 /= true
    res4 **= 1
    res4 *= 2.3
    res4 /= true
    if res4 != 0 {return res4}
    t5 **= 1
    t5 *= 2.3
    t5 /= true
    var res5 = check(t5,50)
    res5 **= 1
    res5 *= 2.3
    res5 /= true
    res5 **= 1
    res5 *= 2.3
    res5 /= true
    if res5 != 0 {return res5}
    t6 **= 1
    t6 *= 2.3
    t6 /= true
    var res6 = check(t6,60)
    res6 **= 1
    res6 *= 2.3
    res6 /= true
    res6 **= 1
    res6 *= 2.3
    res6 /= true
    if res6 != 0 {return res6}
    t7 **= 1
    t7 *= 2.3
    t7 /= true
    var res7 =. check(t7,70)
    res7 **= 1
    res7 *= 2.3
    res7 /= true
    res7 **= 1
    res7 *= 2.3
    res7 /= true
    if res7 != 0 {return res7}
    t8 **= 1
    t8 *= 2.3
    t8 /= true
    var res8 = check(t8,80)
    res8 **= 1
    res8 *= 2.3
    res8 /= true
    res8 **= 1
    res8 *= 2.3
    res8 /= true
    if res8 != 0 {return res8}

    return 0
}
