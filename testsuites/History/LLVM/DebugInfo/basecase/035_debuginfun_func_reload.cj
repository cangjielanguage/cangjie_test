// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() {
    var mainnum: Int64 =demoinfun()
    return mainnum
}
func demoinfun(): Int64 {
    var Functioncall008: Int64 = demofun001(5, 5) //函数重载  Functioncall008=10
    return Functioncall008
}
func demofun001(): Int32 {
    var a: Int32 = 10
    var b: Int32 = 20
    return a + b
}
func demofun001(a: Int64, b: Int64 ): Int64 {
    return a + b
}

// ASSERT:scan  4: call default.demoinfun:l;
// ASSERT:scan  8: newobj default.demoinfun_l_Context
// ASSERT:scan  8: call default.demofun001:l;l;l;
// ASSERT:scan  17: newobj default.demofun001_l_l_l_Context
// ASSERT:scan  17: sta.obj
