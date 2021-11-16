// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

record A<X,Y,Z>{}

trait update{
operator func +(a:This,b:This):Bool
}

append<X,Y> A<X,Y,Int8> with update {
operator func +(a:A<X,Y,Int8>,b:A<X,Y,Int8>):Bool {true}

}

func main(): Int64 {
var a : A<Int16,Int16,Int16> = A<Int16,Int16,Int16>()
var b : A<Int16,Int16,Int16> = A<Int16,Int16,Int16>()
if (!(b+a)) { // EXPECTED: regex type check of binary expression fails
return 1
}
return 0
}
