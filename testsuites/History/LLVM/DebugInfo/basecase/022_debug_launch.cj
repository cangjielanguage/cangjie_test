// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() {
    var a: Int64 = 1
    var b: Int64 = 2
    var c: Int64 = 3
    var d: Int64 = 4
    var e: Int64 = 1
    //变量初始化
    var f: Int32

    //函数名处
    f = launchfun001()
    e = a + b + c + d
    return e
}


func launchfun001(): Int32 {
    var a: Int32 = 10
    var b: Int32 = 20
    return a + b
}

// ASSERT:scan  13: call default.launchfun001:i;
// ASSERT:scan  20: newobj default.launchfun001_i_Context

