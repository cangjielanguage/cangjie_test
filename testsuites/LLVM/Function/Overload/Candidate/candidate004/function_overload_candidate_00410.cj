// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func f(a: Int8) : Int32{return 1}
func f(a: Int16) : Int64{return 2}

func main():Int64{
    let a : Int64 = f(1)
    if (a != 2) {
        return 1
    }
    return 0
}