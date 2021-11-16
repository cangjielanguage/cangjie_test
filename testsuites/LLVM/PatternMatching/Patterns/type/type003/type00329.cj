// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
enum A{
a(Int32)|b(Int32)
}

func test(): Int64 {
var i : A = A.a(1)
let j : A = A.a(1)
var res = match (i) {
case a : Int32 => 1
case $j => 2 // EXPECTED: regex no overloaded '==' function in match case pattern
case b(x) => 3
case a => 4
case _ => 5
case a(x) => 6
}
if (res == 4) {
return 0
}
return 1
}

func main(): Int64 {
return test()
}
