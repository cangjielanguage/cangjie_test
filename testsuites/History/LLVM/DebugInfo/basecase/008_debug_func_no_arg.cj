// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() {
    var Functioncall001: Int32 = demofun001() //单行中只有一个调用 ,无入参： Functioncall001=30
    var Functioncall002: Int32 = demofun001() + demofun001() //单行中多个调用： Functioncall002=60
    var Functioncall003: Int8 = demofun005() //external函数被调用： Functioncall003=30
    var a: Int64 = 10
    return a
}
func demofun001(): Int32 {
    var a: Int32 = 10
    var b: Int32 = 20
    return a + b
}
external func demofun005(): Int8 {
    var a: Int8 = 10
    var b: Int8 = 20
    return a + b
}

// ASSERT:scan  4: call default.demofun001:i;
// ASSERT:scan  5: call default.demofun001:i;
// ASSERT:scan  6: call default.demofun005:a;
// ASSERT:scan  11: newobj
// ASSERT:scan  16: newobj
// ASSERT:scan  13: return
// ASSERT:scan  18: return
// ASSERT:scan-not  10:
// ASSERT:scan-not  15: