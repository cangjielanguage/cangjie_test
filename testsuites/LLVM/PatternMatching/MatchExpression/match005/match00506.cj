// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var range = 0..10
    for (i in range) {
        match (i) {
            case _ =>
                 1;
                 continue;
        }
    }
    return 0
}
