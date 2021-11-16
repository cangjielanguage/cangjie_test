// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() {
    var var3: Int64 = 1
    var3 = 2    //设置行断点
    while (var3 == 2) {
        var3 = 3    //设置行断点
    }
    return var3
}

// DEPENDENCE: ../parseDebugInfo.py 001_debug_cover_expected.txt
// EXEC: %compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output > actual.txt
// EXEC: python parseDebugInfo.py --a actual.txt --e 001_debug_cover_expected.txt



// ASSERT:scan-not  8:
