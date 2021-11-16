// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex illegal object in toplevel\, toplevel must consist of declaration or definition
func main(): Int64 {
    return 0
}
return
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
