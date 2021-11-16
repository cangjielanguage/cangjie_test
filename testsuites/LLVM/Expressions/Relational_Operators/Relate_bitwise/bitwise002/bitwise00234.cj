// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-auto  missing '(' in if expression
func main(): Int64 {
    var a:Int8 = 8
    a = 12 << if
    a = 12 >> else
    return 0 
}
