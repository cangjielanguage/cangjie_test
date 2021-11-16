// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

trait Num1 {
func plus(a: This, b: This): This
}

trait Num2 {
func plus(a: This, b: This): This
}

append Int32 with Num1{
func plus(a:Int32,b:Int32):Int32{
return a+1
}
}


func plus<T>(a:T,b:Int32):T{
return a
}
func plus(a:Int32):Int32{
return a
}

func main():Int64{
var a0:Int32 = 1
var a:Int32 = plus(a0,a0) // EXPECTED: regex error.*?ambiguous match for function call
var b:Int32 = plus<Int32>(a0,a0) //EXPECTED: regex error.*?ambiguous match for function call
if (a != 2) {
return 1
}
if (b != 2) {
return 1
}
return 0
}
