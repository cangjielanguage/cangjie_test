// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex initializer's type is incompatible with variable declaration 'a'
func main(): Int64 {
    var a:Float32 = -340282366920938463463374607431768211457
    var b:Float32 = -340282366920938463463374607431768211457
    if (a-b>0.0001) {
        return 1
    }
    return 0
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
