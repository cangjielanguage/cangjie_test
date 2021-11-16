// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() {
    var mainnum: Int64 =demoinfun()
    return mainnum
}
func demoinfun(): Int64 {   //设置断点：8/9/10/11 第9行不能设置断点
    var hundredo = 0
    do {
        hundredo++ //hundredo先自加1后进入while循环
    } while (hundredo < 10)
    return hundredo
}
// DEPENDENCE: ../parseDebugInfo.py 029_debuginfun_dowhile_expected.txt
// EXEC: %compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output > actual.txt
// EXEC: python parseDebugInfo.py --a actual.txt --e 029_debuginfun_dowhile_expected.txt


// ASSERT:scan  10: call
// ASSERT:scan-not  9:
// ASSERT:scan-not  13: