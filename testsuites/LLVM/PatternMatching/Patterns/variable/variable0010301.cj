// EXEC:%compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args

func test(): Int64 {
var i : Int32 = 0
var test : Int32 = 0
match (i) {
case test =>  // EXPECTED: regex warning.*'test' has been defined in the outside of match expression, are you sure using 'test' as a variable pattern here?
test
test
}
return Int64(test)
}

func main(): Int64 {
return test()
}
