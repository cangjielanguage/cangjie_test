// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() {
    var Functioncall006: Int32 = demofun007(2, b: 2) //命名形参 Functioncall006=4
    var Functioncall007: Int32 = demofun007(2) //可选形参  Functioncall007=3
    var a: Int64 = 10
    return a
}
func demofun007(a: Int32, b!: Int32 = 1): Int32 {
    var a1: Int32 
    a1 = a
    var b1: Int32 = b
    return a1 + b1
}

// ASSERT:scan  4: call default.demofun007:i;i;i;
// ASSERT:scan  5: call default.demofun007:i;i;i;
// ASSERT:scan  11: newobj
// ASSERT:scan  12: mov
// ASSERT:scan  7: return




