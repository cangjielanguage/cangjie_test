// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(a!:Int16 = 1):Int64{return 1}

func main(){
    func test(a!:Int8 = 1):Int64{return 2}
    if (test() == 2) {
        return 0
    }
    return 1
}
