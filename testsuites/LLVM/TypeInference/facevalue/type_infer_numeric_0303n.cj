// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


func foo(x: Int8): Int32 {
return 2 // 2 is inferred to be Int32
}
func foo(x: Int64): Int64 {
return 3 // 2 is inferred to be Int64
}
func foo(x: Float32): Float64 {
return 3.0 // 3.0 is inferred to be Float64
}
func foo(x: Float64): Float32 {
return 3.0 // 3.0 is inferred to be Float32
}

func main(): Int64{
var i1: Int8 = foo(3) // EXPECTED: regex no matching function declaration for function call 'foo'
var i2: Int32 = foo(3.0) // EXPECTED: regex cannot convert a floating-point literal to type 'Int8'
return 0
}
