// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
return run()
}

record Data {
public let width: Int32 = 1
public let length: Int32 =2
}

func run(): Int64 {
var width: Int32 = Data.width //EXPECTED: regex 'width' is non-static member, cannot access by type name
return 0
}
