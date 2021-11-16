// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() {
    var mainnum: Int64 =demoinfun()
    return mainnum
}
func demoinfun(): Int64 {   //设置断点：8/9/10/11 第11行不能设置断点
    var hundred: Int64 = 0
    while (hundred < 10) { // until hundred < 10
        hundred++
    }
    return hundred
}
// DEPENDENCE: ../parseDebugInfo.py 028_debuginfun_while_expected.txt
// EXEC: %compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output > actual.txt
// EXEC: python parseDebugInfo.py --a actual.txt --e 028_debuginfun_while_expected.txt


// ASSERT:scan-not  11: