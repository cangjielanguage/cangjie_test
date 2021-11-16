// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test<X>(a:X){return 1}
func test<X,Y,Z>(a:X){return 2}


func main():Int64{
    var I = test<Int64>(1)
    if (I != 1) {
        return 1
    }
    return 0
}