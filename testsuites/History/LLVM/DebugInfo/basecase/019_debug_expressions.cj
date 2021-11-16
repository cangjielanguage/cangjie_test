// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() { 
    //自增自减表达式：6/7
    var owni: Int64 = 5
    owni++ //6
    owni-- //5

    //算术表达式 ：10行 count=11.000000
    let count = 6.0 + 10.0 - 3.0 * 4.0 + 6.6 / 1.1 + 4.0 % 3.0

    //关系表达式：13-18行
    3 < 4 // return true
    3 <= 3 // return true
    3 > 4 // return false
    3 >= 3 // return true
    3.14 == 3.15 // return false
    3.14 != 3.15 // return true

    //位运算表达式：21/22
    let weip: Int8 = -30
    let weiq = weip << 2 // weiq = -120

    //逻辑表达式 26/27
    var expr1: Bool = false
    let expr2: Bool = true
    expr1 = false && expr1 || expr2 // return true.

    return owni
}

// ASSERT:scan  6: call
// ASSERT:scan  7: call
// ASSERT:scan  10: sta.64
// ASSERT:scan  13: jmp label.3
// ASSERT:scan  22: ashri 0x18
// ASSERT:scan  27: jmp label.15
