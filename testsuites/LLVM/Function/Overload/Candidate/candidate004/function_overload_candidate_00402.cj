// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(a:Int8):Int64{1}
func test(a:Bool):Int64{2}

func main():Int64{
    if (test(true) != 2) {
        return 1
    }
    return 0
}