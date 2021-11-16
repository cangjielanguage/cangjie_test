// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() {   //设置断点：4-10 9和10行设置断点后，显示失败图标
    var indexcontinue: Int64 = 0
    while (indexcontinue < 50) {
        indexcontinue++
        if ((indexcontinue % 4 == 0) && (indexcontinue % 6 == 0)) {
            continue //在indexcontinue=12/24/36/48时进入continue
        }
    }
    return indexcontinue
}

// DEPENDENCE: ../parseDebugInfo.py 007_debug_continue_expected.txt
// EXEC: %compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output > actual.txt
// EXEC: python parseDebugInfo.py --a actual.txt --e 007_debug_continue_expected.txt


// ASSERT:scan  8:
// ASSERT:scan-not  9:
// ASSERT:scan-not  10: