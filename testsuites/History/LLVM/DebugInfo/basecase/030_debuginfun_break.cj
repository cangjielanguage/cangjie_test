// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() {
    var mainnum: Int64 =demoinfun()
    return mainnum
}
func demoinfun(): Int64 {   //设置断点： 8-14 13和14行设置断点后，显示失败图标
    var indexbreak: Int64 = 0
    while (indexbreak < 50) {
        indexbreak++ //indexbreak自++,当=12时，进入if的break语句
        if ((indexbreak % 4 == 0) && (indexbreak % 6 == 0)) {
            break
        }
    }
    return indexbreak
}

// DEPENDENCE: ../parseDebugInfo.py 030_debuginfun_break_expected.txt
// EXEC: %compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output > actual.txt
// EXEC: python parseDebugInfo.py --a actual.txt --e 030_debuginfun_break_expected.txt



// ASSERT:scan  10: call
// ASSERT:scan-not  13:
// ASSERT:scan-not  14: