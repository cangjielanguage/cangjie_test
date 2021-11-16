// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

type int = Int32
type str = String

func foo(x: int, y: str): str {
return x.toString() + y
}

func foo(x: Int32, y: String): String { // EXPECTED: regex function 'foo' has overload conflicts
return x.toString() + y.toString()
}

func main(): Int64 {
var i: int = 3
let s: str = "hi"
var res: str = foo(i, s)
if (res == "3hi") {
return 0
}
return 1
}
