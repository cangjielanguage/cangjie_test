// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() {
    var mainnum: Int64 =demoinfun()
    return mainnum
}
func demoinfun(): Int64 {   //设置断点：小括号10/12 大括号13/15
    var hundredk: Int64 = 1
    while
    (
        hundredk < 10
        )
        {
        hundredk++
    }
    //设置断点：注释行16
    //设置断点：中括号19/21
    var a : Array<
    Int32

    >
    = @{1, 2, 3}
    """
    多行字符串测试//设置断点： 23-26

    """

    var owni: Int64 = 5
    return owni
}

// DEPENDENCE: ../parseDebugInfo.py 043_debuginfun_notsetbp_expected.txt
// EXEC: %compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output > actual.txt
// EXEC: python parseDebugInfo.py --a actual.txt --e 043_debuginfun_notsetbp_expected.txt

// ASSERT:scan-not  10:
// ASSERT:scan-not  12:
// ASSERT:scan-not  13:
// ASSERT:scan-not  15:
// ASSERT:scan-not  16:
// ASSERT:scan-not  19:
// ASSERT:scan-not  20:
// ASSERT:scan-not  21:
// ASSERT:scan-not  24:
// ASSERT:scan-not  26:
