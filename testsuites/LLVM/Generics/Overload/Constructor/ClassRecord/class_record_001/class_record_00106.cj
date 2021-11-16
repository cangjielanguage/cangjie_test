// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface A{}
interface B{}
class C <: A & B{}


class X{
init(a:A){print("A_first")}
init(a:B){print("A_second")}
}

record Y{
init(a:A){print("B_first")}
init(a:B){print("B_second")}
}

func main():Int64{
var i = X(C()) // EXPECTED: regex ambiguous match for constructor call
var j = Y(C()) // EXPECTED: regex ambiguous match for constructor call
return 0
}
