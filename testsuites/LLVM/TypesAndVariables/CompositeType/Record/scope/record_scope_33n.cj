// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


func main(): Int64 {
return run()
}

record Data {
static func area(): Int32 {
return 2
}
}

func run(): Int64 {
var area: Int32 = Data().area() // EXPECTED: regex object cannot access static member 'area'
return 0
}
