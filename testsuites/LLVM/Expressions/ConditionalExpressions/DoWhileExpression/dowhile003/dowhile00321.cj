// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class A{
var a : Int32
init(){
this.a = 1
}
func test():Int32{
do {
this() // EXPECTED: regex invalid calling 'this' outside the constructor
return 1
} while (true)
return 1
}
}


func main(): Int64 {
while (true) {
var a = A()
a.test()
return 0
}
return 1
}
