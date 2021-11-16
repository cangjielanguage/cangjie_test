// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() {
    var mainnum: Int64 =demoinfun()
    return mainnum
}
func demoinfun(): Int64 {   //设置断点：9/10/11
    var i8Number: Int8 = 127
    var i16Number: Int16 = 0
    i16Number = Int16(i8Number) // ok: i16Number = 127
    i8Number = Int8(i16Number) // ok: i8Number = 127

    var var1: Int64 = 9
    return var1
}

// ASSERT:scan  4: call default.demoinfun:l;
// ASSERT:scan  8: newobj default.demoinfun_l_Context
// ASSERT:scan  8: label.0:
// ASSERT:scan  8: movi
// ASSERT:scan  9: movi
// ASSERT:scan  10: lda
// ASSERT:scan  11: lda
