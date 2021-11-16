// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


open class A{}
open class B <: A{}
open class C <: B{}

open class D{}
open class E <: D{}
open class F <: E{}

open class G{}
open class H <: G{}
open class I <: H{}

func f<X,Y,Z>(a:X*Y*Z) where X<:A,Y<:D,Z<:G{1} //F1
func f<X,Y,Z>(a:X*Y*Z) where X<:A,Y<:E,Z<:H{0} //F2


func main() {
    f((C(),F(),I()))
}
