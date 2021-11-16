// EXEC:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func test(): Int64 {
var i_out : Int64 = 0
let myLambda = { i_in : Int64 =>  // EXPECTED: regex-auto lambda captured a mutable variable directly, lambda cannot be assigned to a variable
var tmp = i_in
tmp = i_out
return tmp
}
return myLambda(1)
}

func main(): Int64 {
return test()
}
