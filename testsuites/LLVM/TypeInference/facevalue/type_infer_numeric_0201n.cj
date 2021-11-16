// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main():Int64{
var num1: Int64 = 2
var res1 = "hello world".charAt(num1)
var res2: Int32 = "hello world".lastIndexOf('e') // EXPECTED: regex no matching function declaration for function call 'lastIndexOf'
var res3: Int32 = "hello world".indexOf('e') // EXPECTED: regex no matching function declaration for function call 'indexOf'

return 0
}
