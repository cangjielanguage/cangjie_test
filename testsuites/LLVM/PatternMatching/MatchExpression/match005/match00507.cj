// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var range = 0..10
    while (true) {
        match (50) {
            case _ =>
                 1;
                 break;
        }
    }
    return 0
}

