// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() { 
    var varreturnexpr: Int32    //设置断点1： 5/14/16
    varreturnexpr = demofun002(10, 20)
    var varreturn: Unit  //设置断点2： 7/22/24
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

// DEPENDENCE: ../parseDebugInfo.py 016_debug_return_expected.txt
// EXEC: %compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output > actual.txt
// EXEC: python parseDebugInfo.py --a actual.txt --e 016_debug_return_expected.txt


// ASSERT:scan  5: call default.demofun002:i;i;i;
// ASSERT:scan  13: newobj default.demofun002_i_i_i_Context
// ASSERT:scan  7: call default.demofun003:i;i;u;
// ASSERT:scan  21: newobj default.demofun003_i_i_u_Context
