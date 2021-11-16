// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() {
    demofun001(2) //函数体为空
    demofun002(2, 1) //函数体if内为空
    return 1
}

func demofun001(a: Int16) {
}

func demofun002(a: Int32, b: Int32) {
    if (a >= b) {
    } else {
    }
}

// DEPENDENCE: ../parseDebugInfo.py 044_debug_func_nobody_expected.txt
// EXEC: %compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output > actual.txt
// EXEC: python parseDebugInfo.py --a actual.txt --e 044_debug_func_nobody_expected.txt


// ASSERT:scan  4: call default.demofun001
// ASSERT:scan  5: call default.demofun002
// ASSERT:scan  9:
// ASSERT:scan  13: newobj default.demofun002



