// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-auto type of function body is incompatible with return type

func main(): Int64 {
    var a : Int32 = 2
    var b : Int32 = 6
    var c : Float32 = add(a, b)
 
    return 0
}

func add(a: Int32, b: Int32):Float32 {
    return a + b
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
