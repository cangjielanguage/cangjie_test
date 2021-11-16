// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() { //设置断点：4/5/6/7/8 第5/7行设置断点后，显示失败图标
    let f1: (Int64, Int64)->Int64 = {a: Int64, b: Int64 
        => 
        a + b
    }
    var lamdba001: Int64 = f1(10, 10)
    return lamdba001
}

// ASSERT:scan  4: newobj
// ASSERT:scan  8: call.virt
// ASSERT:scan  6: label.0:
