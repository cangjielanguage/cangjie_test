// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@when[debug]
func main() {
    return 0
}

@when[!debug]
func main() {
    return 0
}