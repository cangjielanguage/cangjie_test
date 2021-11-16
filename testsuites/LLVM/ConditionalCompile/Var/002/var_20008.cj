// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan illegal expression in @when condition

@when[backend = "*"]
func main() {
    return 0
}