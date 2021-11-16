// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    let a: Int32 = 1

    var ret = if (true) {
        {return a}
    } else {
        {return a}
    }

    if ( ret() != 1) {
        return 1
    }

    return 0
}