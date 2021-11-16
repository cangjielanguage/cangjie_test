// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A{}
interface B <: A{}
interface C <: A{}
open class D <: B & C{}
open class E <: D{}

func f<X>(a:X) where X <: A{1}
func f<X>(a:X) where X <: B{1}
func f<X>(a:X) where X <: C{1}
func f<X>(a:X) where X <: D{0}


func main() {
    f(E())
}
