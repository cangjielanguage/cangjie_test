// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


class A{
init(){
var a = [this()] // EXPECTED: regex-auto call to 'this' must be first expression in constructor of class 'A'

}
}

func main(): Int64 {
return A()
}
