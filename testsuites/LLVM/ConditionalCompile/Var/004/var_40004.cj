// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan conditional compilation not support this expression

@when[!!debug]
func main() {
    return 0
}

@when[!!!debug]
func main() {
    return 0
}