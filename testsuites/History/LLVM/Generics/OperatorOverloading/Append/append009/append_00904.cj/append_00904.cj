// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

record A<X,Y>{}

trait update{
operator func +(a:This,b:This):Bool
}

append<X,Y> A<X,Y> with update {
operator func +(a:A<X,Y>,b:A<Y,X>):Bool {true} // EXPECTED: regex-auto function '+' has no related trait

}

func main(): Int64 {
var a : A<Int16,Int32> = A<Int16,Int32>()
var b : A<Int16,Int32> = A<Int16,Int32>()
if (!(b+a)) {
return 1
}
return 0
}
