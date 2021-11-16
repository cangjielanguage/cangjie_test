// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test<T>(a:T):Int8{1}
func test<T>(a:T,b!:Int8=1):Int16{2}

func main():Int64{
    func test(a:Int64):Int32{3}
    var I : Int8 = test(1)
    if (I != 1) {
        return 1
    }
    return 0
}
