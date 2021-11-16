// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64{
    var i = [1,2,match (5) {case _=> 3}]
    if (i[match (0) {case _ => 2}] == 3) {
        return 0
    }
    return 1
}

