// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test<T> (a:T):Int64{1}
func test<T> (a:T,b!:Bool=true):Int32{2}


func main():Int64{
    var I : Int32 = test(1)
    if (I != 2) {
        return 1
    }
    return 0
}
