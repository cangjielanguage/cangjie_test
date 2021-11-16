// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() {
    var mainnum: Int64 =demoinfun()
    return mainnum
}
func demoinfun(): Int64 {
    var varreturnexpr: Int32    //设置断点1： 9/18/20
    varreturnexpr = demofun002(10, 20)
    var varreturn: Unit //设置断点2： 11/26/28
    varreturn = demofun003(10, 20)

    var var1: Int64 = 9
    return var1
}
func demofun002(a: Int32, b: Int32): Int32 {
    if (a >= b) {
        return a
    } else {
        return b
    }
}

func demofun003(a: Int32, b: Int32): Unit {
    if (a >= b) {
        return
    } else {
        return
    }
}

// DEPENDENCE: ../parseDebugInfo.py 039_debuginfun_return_expected.txt
// EXEC: %compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output > actual.txt
// EXEC: python parseDebugInfo.py --a actual.txt --e 039_debuginfun_return_expected.txt



// ASSERT:scan  9: call demofun002:i;i;i;
// ASSERT:scan  17: newobj demofun002_i_i_i_Context
// ASSERT:scan  11: call demofun003:i;i;u;
// ASSERT:scan  25: newobj demofun003_i_i_u_Context
