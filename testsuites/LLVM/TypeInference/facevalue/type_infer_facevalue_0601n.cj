// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func foo_char(): Char {
return "hi" // EXPECTED: regex type of return expression is incompatible with return type
}

func foo_string(): String {
return 'a' // EXPECTED: regex type of return expression is incompatible with return type
}

func foo_bool(): Bool {
return 2 // EXPECTED: regex type of return expression is incompatible with return type
}

func foo_unit(): Unit {
return 4 // EXPECTED: regex type of return expression is incompatible with return type
}

func foo_lambda(): (Int32, Int32)->Int32{
return { x:Int32 => return x } // EXPECTED: regex type of return expression is incompatible with return type
}

func foo_array(): Array<Int64> {
return #{1,2,3} // EXPECTED: regex type of return expression is incompatible with return type
}

func foo_tuple(): Float64*String{
return 3.1415 // EXPECTED: regex type of return expression is incompatible with return type
}

func run():Int64{
var arr = foo_array()
var len = arr.size
if (foo_char() == 'a' && foo_string() == "hello" && !foo_bool() && foo_unit() == () && foo_lambda()(2,3) == 5 && len == 3 && foo_tuple()[0] == 3.1415) {
return 0
}
return 1
}

func main(): Int64 {
return run()
}
