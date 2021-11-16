// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@when[debug || !debug]
func main() {
    return 0
}