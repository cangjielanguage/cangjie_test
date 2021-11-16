// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
func main() : Unit {
    return return
}
// ASSERT: regex-not stack trace
// ASSERT: regex-not core dumped
