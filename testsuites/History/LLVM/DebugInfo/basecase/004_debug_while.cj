// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() { //设置断点：4/5/6/7 第7行设置断点后，显示失败图标
    var hundred: Int64 = 0
    while (hundred < 10) { // until hundred < 10
        hundred++
    }
    return hundred
}


// DEPENDENCE: ../parseDebugInfo.py 004_debug_while_expected.txt
// EXEC: %compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output > actual.txt
// EXEC: python parseDebugInfo.py --a actual.txt --e 004_debug_while_expected.txt


// ASSERT:scan-not  7: