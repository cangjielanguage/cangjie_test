// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class C1{
let a : Int64
init(){
this.a = 1
}
let initExpression = { b : Int64 => this()} // EXPECTED: regex invalid calling 'this' outside the constructor
}

func test(): Int64 {
return 1
}

func main(): Int64 {
return test()
}
