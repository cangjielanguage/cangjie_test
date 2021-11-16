// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan conditional compilation not support this expression

@when[backend + backend]
func main() {
    return 0
}