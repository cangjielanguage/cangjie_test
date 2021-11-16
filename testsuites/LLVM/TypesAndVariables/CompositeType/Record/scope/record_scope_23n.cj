// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


func main(): Int64 {
return run()
}

record Data {
static let width: Int32 = 1
static let length: Int32 =2
}

func run(): Int64 {
var width: Int32 = Data().width // EXPECTED: regex 'width' is not a member of record 'Data'
var length: Int32 = Data().length // EXPECTED: regex 'length' is not a member of record 'Data'
return 0
}
