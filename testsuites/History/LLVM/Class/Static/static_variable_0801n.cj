// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface Base {
let a: Int32 = 1
}

class Data <: Base {
static let b:Int32 = a // EXPECTED: regex error.*?undeclared identifier 'a'
}

func run(): Int64 {
if Base.a != 1 {
return 1
}
if Data.a != 1 {
return 1
}
return 0
}

func main(): Int64 {
return run()
}
