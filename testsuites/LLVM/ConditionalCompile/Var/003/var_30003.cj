// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@when[cjc_version <= "0.19.3"]
func main() {
    return 0
}

@when[cjc_version > "0.19.3"]
func main() {
    return 0
}