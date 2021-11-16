// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


func main(): Int64 {
return run()
}

record Data {
public private let width: Int32 = 1 // EXPECTED: regex modifiers 'public' and 'private' are conflict in variable declaration
protected let length: Int32 =2 // EXPECTED: regex 'protected' modifier is illegal for variable declaration in record body
}

func run(): Int64 {
var width: Int32 = Data().width
var length: Int32 = Data().length
return 0
}
