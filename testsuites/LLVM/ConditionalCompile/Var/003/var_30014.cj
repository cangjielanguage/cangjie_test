// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan conditional compilation not support this expression

@when["0.19.3" == cjc_version]
func main() {
    return 0
}