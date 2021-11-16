// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
open class A{}
open class B <: A{}

func foo<X>(a: X, b: X): Int64 {0} //  foo1
func foo<X>(a:B, b:X) :Int64 {1} // foo2


func main() {
    foo(A(),B())
}
