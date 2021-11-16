// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() { //设置断点：5/6/7
    var i8Number: Int8 = 127
    var i16Number: Int16 = 0
    i16Number = Int16(i8Number) // ok: i16Number = 127
    i8Number = Int8(i16Number) // ok: i8Number = 127

    var var1: Int64 = 9
    return var1
}

// ASSERT:scan  4: label.0:
// ASSERT:scan  4: movi
// ASSERT:scan  5: movi
// ASSERT:scan  6: lda
// ASSERT:scan  7: lda
