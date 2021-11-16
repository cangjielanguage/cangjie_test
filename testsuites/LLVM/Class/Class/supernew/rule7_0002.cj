// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
class A {

this // EXPECTED: regex illegal class member in class block

var a = this // EXPECTED: regex 'this' is not allowed to initialize non-static member

 
var b = this() // EXPECTED: regex invalid calling 'this' outside the constructor

var d = this.a 
}

func main(): Int64 {
    return 0
}