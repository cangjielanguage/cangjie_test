// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class A{}
oen class B <: A{}
open class C <: B{}

open class D{}
open class E <: D{}
open clas F <: E{}

open class G{}
open class H <: G{}
open class I <: H{}

func f<X,Y,Z>(a:X*Y*Z) where X<:A,Y<:F,Z<:I{0} //F1
func f<X,Y,Z>(a:X*Y*Z) where X<:C,Y<:D,Z<:I{1} //F2
func f<X,Y,Z>(a:X*Y*Z) where X<:C,Y<:F,Z<:G{1} //F3


func main() {
f((C(),F(),I()))
}