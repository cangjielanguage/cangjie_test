// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

abstract record Data1 { // EXPECTED: regex 'abstract' modifier is illegal for record declaration in top level
let width: Int32 = 1
let length: Int32 =2
}

open record Data2 { // EXPECTED: regex 'open' modifier is illegal for record declaration in top level
let width: Int32 = 1
let length: Int32 =2
}

private record Data { // EXPECTED: regex 'private' modifier is illegal for record declaration in top level
let width: Int32 = 1
let length: Int32 =2
}

func main(): Int64 {
return run()
}

func run(): Int64 {
var res: Int32
var a: Int32 = 3
var b: Int32 = 4
let data: Data1 = Data1(3, 4)
let data: Data2 = Data2(3, 4)
let data: Data = Data(3, 4)
return 1
}
