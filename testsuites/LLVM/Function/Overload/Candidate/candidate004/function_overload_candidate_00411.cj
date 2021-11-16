// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func f(a: Int32) : Int64{return 2}
func f(a: Int64) : Int32{return 1}

func main():Int64{
    let a : Int64 = f(1)
    if (a != 2) {
        return 1
    }
    return 0
}