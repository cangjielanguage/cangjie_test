// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() { //设置断点：4-15行 //不会执行到的代码：9/12
    var if001: Bool = true
    var if_a: Int64 
    if (if001) {
        if_a = 1   //if_a = 1
    } else {
        if_a = 2
    }
    if (!if001) {
        if_a = 1   
    } else {
        if_a = 2    //if_a = 2
    }
    return if_a
}

// DEPENDENCE: ../parseDebugInfo.py 002_debug_if_expected.txt
// EXEC: %compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output > actual.txt
// EXEC: python parseDebugInfo.py --a actual.txt --e 002_debug_if_expected.txt


// ASSERT:scan  4: label.0:
// ASSERT:scan-not  5:
// ASSERT:scan-not  10:
// ASSERT:scan-not  15: