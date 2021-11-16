// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A{}
open class B <: A{}
open class C <: B{}
open class D <: C{}
open class E <: D{}

func f<X>(a:X)where X<:A{1}
func f(a:B){0}

func main() {
    f(C())
}
