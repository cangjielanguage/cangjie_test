// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT:scan conditional compilation's condition value should be string

@when[os == ""]
func main() {
    return 0
}
