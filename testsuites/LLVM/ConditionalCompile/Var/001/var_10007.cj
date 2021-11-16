// ERRCHECK: %compiler %cmp_opt %f -c -o %output
// ASSERT:scan conditional compilation not support this expression

@when[os + os]
func main() {
    return 0
}
