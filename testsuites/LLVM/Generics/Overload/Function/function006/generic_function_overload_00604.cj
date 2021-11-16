// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Base{}

func test<X,Y>(a:X,b:Y){return 1}
func test<X>(a:Base,b:X){return 2}


func main():Int64{
    var I = test<Int64>(Base(),1)
    if (I != 2) {
        return 1
    }
    return 0
}