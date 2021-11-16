// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Base{}
class Sub <: Base{}

func test<X,Y>(a:X,b:Y) {return 1}
func test<X>(a:Base,b:X) where X <: Sub {return 2}
func test<X>(a:Base,b:X) where X <: Base {return 3}


func main():Int64{
    var I = test<Sub>(Base(),Sub())
    if (I != 2) {
        return 1
    }
    return 0
}