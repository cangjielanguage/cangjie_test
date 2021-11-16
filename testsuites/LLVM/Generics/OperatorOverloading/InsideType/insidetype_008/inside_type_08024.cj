// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class A<T>{
var a:Int32=1
operator func *(b:A<T>):Bool {
this.a // EXPECTED: regex-not error
super.b // EXPECTED: regex-auto 'b' is not a member of class 'Object'
return true
}
}



func main(): Int64 {
var a : A<Int32> = A<Int32>()
var b : A<Int32> = A<Int32>()
if (!(b*a)) {
return 1
}
return 0
}
