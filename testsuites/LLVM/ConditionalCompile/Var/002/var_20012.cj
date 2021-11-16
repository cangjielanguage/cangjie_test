// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan conditional compilation not support this expression


@when["llvm" == backend]
func main() {
    return 0
}