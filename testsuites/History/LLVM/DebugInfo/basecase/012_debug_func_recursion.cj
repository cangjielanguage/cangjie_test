// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() {
    var Functioncall009: Int32 = demofun008(5) //函数递归/ Functioncall009=15
    var a: Int64 = 10
    return a
}
func demofun008(a: Int32): Int32 {
    if (a == 0) {
        return 0
    } else {
        return a + demofun008(a-1)
    }
}

// DEPENDENCE: ../parseDebugInfo.py 012_debug_func_recursion_expected.txt
// EXEC: %compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output > actual.txt
// EXEC: python parseDebugInfo.py --a actual.txt --e 012_debug_func_recursion_expected.txt


// ASSERT:scan  4: call default.demofun008:i;i;
// ASSERT:scan  12: call default.demofun008:i;i;
// ASSERT:scan-not  11:
// ASSERT:scan-not  13:

