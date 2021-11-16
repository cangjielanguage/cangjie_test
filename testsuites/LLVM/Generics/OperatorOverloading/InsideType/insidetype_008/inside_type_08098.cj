// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


record A<T>{
operator func *(b:A<T>):Bool {
this.a // EXPECTED: regex-auto 'a' is not a member of record 'A'
super.b // EXPECTED: regex-auto 'super' can only be used in class
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
