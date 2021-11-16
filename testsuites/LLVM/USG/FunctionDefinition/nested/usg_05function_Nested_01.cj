// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output  2>&1| compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


func add(i: Int64, j: Int64) {
    i + j
}
func add(i: Float64, j: Float64) {
    i + j
}
func main() {
    var plus = add // EXPECTED:regex error.*?reference to overloaded function 'add' could not be resolved
