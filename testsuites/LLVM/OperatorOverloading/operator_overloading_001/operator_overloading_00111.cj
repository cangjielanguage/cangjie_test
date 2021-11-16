// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


class A{
let a : Int32
protected operator func +(inputB:A):Int32{
return 1
}
init(a:Int32){
this.a = a
}
}


func main():Int64{
var a = A(1)
var b = A(-1)
return (a+b) // EXPECTED: regex error.*?invalid binary operator \'\+\' on type \'Class-A\' and \'Class-A\'
