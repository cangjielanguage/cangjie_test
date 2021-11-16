// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() {   //设置断点：小括号6/8 大括号9/11
    var hundredk: Int64 = 1
    while
    (
        hundredk < 10
        )
        {
        hundredk++
    }
    //设置断点：注释行12
    //设置断点：中括号15/17
    var a : Array<
    Int32

    >
    = @{1, 2, 3}
    """
    多行字符串测试//设置断点： 19-22

    """

    var owni: Int64 = 5
    return owni
}

// DEPENDENCE: ../parseDebugInfo.py 020_debug_notsetbp_expected.txt
// EXEC: %compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output > actual.txt
// EXEC: python parseDebugInfo.py --a actual.txt --e 020_debug_notsetbp_expected.txt


// ASSERT:scan-not  6:
// ASSERT:scan-not  8:
// ASSERT:scan-not  9:
// ASSERT:scan-not  11:
// ASSERT:scan-not  12:
// ASSERT:scan-not  15:
// ASSERT:scan-not  16:
// ASSERT:scan-not  17:
// ASSERT:scan-not  20:
// ASSERT:scan-not  22:


