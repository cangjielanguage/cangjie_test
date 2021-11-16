// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


func main(): Int64 {
return run()
}

record Data {
public private func area(): Int32 { // EXPECTED: regex modifiers 'public' and 'private' are conflict in function declaration
return 2
}
}

func run(): Int64 {
var area: Int32 = Data().area()
return 0
}
