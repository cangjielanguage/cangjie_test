// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() {
    var mainnum: Int64 =demoinfun()
    return mainnum
}
func demoinfun(): Int64 {
    var Functioncall004: Int16 = demofun006(2) //单行中只有一个调用 ,单入参/ Functioncall004=2
    var Functioncall005: Int32 = demofun002(2, 1) //单行中只有一个调用 ,双入参 Functioncall005=2
    var a: Int64 = 10
    return a
}
func demofun002(a: Int32, b: Int32): Int32 {
    if (a >= b) {
        return a
    } else {
        return b
    }
}
func demofun006(a: Int16): Int16 {
    if (a >= 1) {
        return a
    } else {
        return 0
    }
}

// DEPENDENCE: ../parseDebugInfo.py 033_debuginfun_func_with_arg_expected.txt
// EXEC: %compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output > actual.txt
// EXEC: python parseDebugInfo.py --a actual.txt --e 033_debuginfun_func_with_arg_expected.txt




// ASSERT:scan  8: call default.demofun006:s;s;
// ASSERT:scan  9: call default.demofun002:i;i;i;
// ASSERT:scan  14: newobj default.demofun002_i_i_i_Context
// ASSERT:scan  21: newobj default.demofun006_s_s_Context
