// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() {
    var mainnum: Int64 =demoinfun()
    return mainnum
}
func demoinfun(): Int64 {   //设置断点：8-19行 //不会执行到的代码：13/16
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
// DEPENDENCE: ../parseDebugInfo.py 026_debuginfun_if_expected.txt
// EXEC: %compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output > actual.txt
// EXEC: python parseDebugInfo.py --a actual.txt --e 026_debuginfun_if_expected.txt


// ASSERT:scan  8: label.0:
// ASSERT:scan-not  9:
// ASSERT:scan-not  14:
// ASSERT:scan-not  19: