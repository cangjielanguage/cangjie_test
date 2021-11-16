// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() {
    var mainnum: Int64 =demoinfun()
    return mainnum
}
func demoinfun(): Int64 {
    //自增自减表达式 ：10/11
    var owni: Int64 = 5
    owni++ //6
    owni-- //5

    //算术表达式 ：14 count=11.000000
    let count = 6.0 + 10.0 - 3.0 * 4.0 + 6.6 / 1.1 + 4.0 % 3.0

    //关系表达式：17-22
    3 < 4 // return true
    3 <= 3 // return true
    3 > 4 // return false
    3 >= 3 // return true
    3.14 == 3.15 // return false
    3.14 != 3.15 // return true

    //位运算表达式：25/26
    let weip: Int8 = -30
    let weiq = weip << 2 // weiq = -120

    //逻辑表达式 30/31
    var expr1: Bool = false
    let expr2: Bool = true
    expr1 = false && expr1 || expr2 // return true.

    return owni
}

// ASSERT:scan  4: call default.demoinfun:l;
// ASSERT:scan  9: newobj default.demoinfun_l_Context
// ASSERT:scan  10: call
// ASSERT:scan  11: call
// ASSERT:scan  14: sta.64
// ASSERT:scan  17: jmp label.3
// ASSERT:scan  26: ashri 0x18
// ASSERT:scan  31: jmp label.15
