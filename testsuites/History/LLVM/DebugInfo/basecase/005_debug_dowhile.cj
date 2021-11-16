// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() {   //设置断点：4/5/6/7 第5行设置断点后，显示失败图标
    var hundredo = 0
    do {
        hundredo++ //hundredo先自加1后进入while循环
    } while (hundredo < 10)
    return hundredo
}

// DEPENDENCE: ../parseDebugInfo.py 005_debug_dowhile_expected.txt
// EXEC: %compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output > actual.txt
// EXEC: python parseDebugInfo.py --a actual.txt --e 005_debug_dowhile_expected.txt


// ASSERT:scan  6: call
// ASSERT:scan-not  5:
// ASSERT:scan-not  9: