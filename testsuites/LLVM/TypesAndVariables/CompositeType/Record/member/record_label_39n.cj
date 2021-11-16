// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
return run()
}

record Data{
let width2: Int32
let length2: Int32
var perimeter2: Unit -> Int32 = {  => 2 * (width2 + length2)} // EXPECTED: regex type before arrow of function type should be embraced by a pair of parentheses
init(x: Int32, y: Int32, z: Unit -> Int32) {
}
}

func run(): Int64 {
var res: Int32
let a: Int32 = 5
let b: Int32 = 6
var c: Unit -> Int32 = {  => a}
let data = Data(a, b, c)
res = data.perimeter2()
return 0
}
