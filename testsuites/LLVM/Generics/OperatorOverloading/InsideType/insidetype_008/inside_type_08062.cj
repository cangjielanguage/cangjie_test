// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

interface A<T>{
operator func *(b:A<T>):Bool {
this() // EXPECTED: regex-auto 'this' can not be used in interface
return true
}
}

class A_B<T> <: A<T>{}

func main(): Int64 {
var a : A<Int32> = A_B<Int32>()
var b : A<Int32> = A_B<Int32>()
if (!(b*a)) {
return 1
}
return 0
}
