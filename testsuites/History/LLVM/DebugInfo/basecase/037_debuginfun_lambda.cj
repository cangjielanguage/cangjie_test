// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() {
    var mainnum: Int64 =demoinfun()
    return mainnum
}
func demoinfun(): Int64 {   //设置断点：8-12 第9/11行设置断点后，显示失败图标
    let f1: (Int64, Int64)->Int64 = {a: Int64, b: Int64 
        => 
        a + b
    }
    var lamdba001: Int64 = f1(10, 10)
    return lamdba001
}

// ASSERT:scan  4: call default.demoinfun:l;
// ASSERT:scan  8: newobj default.demoinfun_l_Context
// ASSERT:scan  12: call.virt
// ASSERT:scan  10: label.0: