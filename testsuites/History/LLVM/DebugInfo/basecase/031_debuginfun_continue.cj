// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() {
    var mainnum: Int64 =demoinfun()
    return mainnum
}
func demoinfun(): Int64 {    //设置断点：8-14 13和14行设置断点后，显示失败图标
    var indexcontinue: Int64 = 0
    while (indexcontinue < 50) {
        indexcontinue++
        if ((indexcontinue % 4 == 0) && (indexcontinue % 6 == 0)) {
            continue //在indexcontinue=12/24/36/48时进入continue
        }
    }
    return indexcontinue
}

// DEPENDENCE: ../parseDebugInfo.py 031_debuginfun_continue_expected.txt
// EXEC: %compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output > actual.txt
// EXEC: python parseDebugInfo.py --a actual.txt --e 031_debuginfun_continue_expected.txt


// ASSERT:scan  12:
// ASSERT:scan-not  13:
// ASSERT:scan-not  14: