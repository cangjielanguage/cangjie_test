// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface A<T>{
operator func *(b:A<T>):Bool {
this.a // EXPECTED: regex 'a' is not a member of interface 'A'
super.b // EXPECTED: regex 'super' cannot be used in interface
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
