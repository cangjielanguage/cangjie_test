// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func foo_char(x: Char = "a"): Char {
return x
}

func foo_string(x:String = 'o'): String {
return x
}

func foo_bool(x: Bool=3): Bool {
return x
}

func foo_unit(x: Unit=()): Unit {
return x
}

/**
B103 未支持Range<Int64>类型声明
func foo_range(x: Range<Int64> = 1...4): Range<Int64>{
return x
}
*/

// var e = #{1: "Aa", 2: "Bb", 3: "Cc"} B103 不支持map类型

func foo_lambda(x:(Int32, Int32)->Int32 = (x:Int32, y:Int32)):(Int32, Int32)->Int32{
return x
}

func foo_array(x: Array<Int64>=#{1,2,3}): Int64{
return x
}

func foo_tuple(x: Float64=3.1415): Float64*String{
return x
}

func run():Int64{
if foo_char() == 'a' && foo_string() == "hello" && foo_bool() && foo_unit() .= () && foo_lambda()(2,3) == 5 && foo_array() == 3 && foo_tuple()[0] == 3.1415{
return 0
}
return 1
}

func main(): Int64 {
return run()
}
