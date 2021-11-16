// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan conditional compilation 'debug' not support this op '=='

@when[debug == "true"]
func main() {
    return 0
}