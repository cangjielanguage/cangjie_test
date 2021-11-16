// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

this // EXPECTED: regex illegal object in toplevel, toplevel must consist of declaration or definition

var a = this // EXPECTED: regex 'this' cannot be used outside class or record or interface

 
var b = this() // EXPECTED: regex 'this' cannot be used outside class or record or interface


var c = this.v  // EXPECTED: regex 'this' cannot be used outside class or record or interface


func main(): Int64 {
    return 0
}