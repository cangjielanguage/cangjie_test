// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan illegal expression in @when condition

@when[backend = "error"]
func main() {
    return 0
}