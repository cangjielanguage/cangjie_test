// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan missing '(' in if expression

func main(): Int64 {
    var a:Int8 = 10
    var b:Int8 = 0
    b = a & if
    b = a & else
    b = a & then
    b = a & int
    return 0
}
