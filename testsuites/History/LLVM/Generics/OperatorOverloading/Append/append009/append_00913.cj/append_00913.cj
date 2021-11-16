// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

record A<X>{}

trait update{
operator func +(a:This,b:This):Bool
}

append<X> A<X> with update where X <: update{
operator func +(a:A<X>,b:A<X>):Bool {true}

}

func main(): Int64 {
var a : A<Int16> = A<Int16>()
a+a // EXPECTED: regex type check of binary expression fails
return 0
}
