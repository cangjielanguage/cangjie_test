// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT:scan conditional compilation not support this expression

@when["linux" == os]
func main() {
    return 0
}
