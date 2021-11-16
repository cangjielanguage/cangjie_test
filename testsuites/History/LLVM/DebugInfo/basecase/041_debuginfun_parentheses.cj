// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() {
    var mainnum: Int64 =demoinfun()
    return mainnum
}
func demoinfun(): Int64 {   //设置断点：8
    var kuonum = (1 + 2) * 3 - 4 // The result is 5.
    return kuonum
}

// ASSERT:scan  4: label.0:
// ASSERT:scan  5: return.64
// ASSERT:scan  8: label.0:
// ASSERT:scan  9: return.64