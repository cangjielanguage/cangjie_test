// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() {
    var mainnum: Int64 =demoinfun()
    return mainnum
}
func demoinfun(): Int64 {
    var var1: Int8 = -128
    var var2: Int8 = 127
    var var3: Int64 = 1
    var var4: Int16 = 1
    var var5: Int32 = 1
    var var6: Int64 = 1
    var var7: UInt8 = 1
    var var8: UInt16 = 1
    var var9: UInt32 = 1
    var var10: UInt64 = 1
    //Float16
    var varf11: Float16 = 0.001
    var varf12: Float16 = 65504.001
    var varf13: Float32 = 0.001
    var varf131: Float32 = 65504.001
    var varf14: Float64 = 1.00
    var varu15: Unit = ()
    var varBool16: Bool = true
    var varchar17: Char = '5'
    //不可变变量
    let var18: Int64 = 9
    //变量声明：30行
    var var19: Int32
    //字面量
    24
    return var3
}

// ASSERT:scan  4: call default.demoinfun:l;
// ASSERT:scan  8: newobj default.demoinfun_l_Context
// ASSERT:scan  8: movi
// ASSERT:scan  9: movi
// ASSERT:scan  10: movi.64
// ASSERT:scan  11: movi
// ASSERT:scan  12: movi
// ASSERT:scan  16: movi.64
// ASSERT:scan  22: fmovi.64
// ASSERT:scan  25: movi
// ASSERT:scan  26: movi
// ASSERT:scan  28: movi.64
// ASSERT:scan  32: ldai.64
// ASSERT:scan  33: jmp label.0