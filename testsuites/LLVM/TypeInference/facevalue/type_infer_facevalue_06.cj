// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func foo_char(): Char {
    return 'a'
}

func foo_string(): String {
    return "hello"
}

func foo_bool(): Bool {
    return false
}

func foo_unit(): Unit {
    return ()
}

// B103 未支持Range<Int64>类型声明
// func foo_range(): Range<Int64>{
//    return 1..4
// }
//  var e = #{1: "Aa", 2: "Bb", 3: "Cc"}    B103 不支持map类型

func foo_lambda(): (Int32, Int32)->Int32{
    return { x:Int32, y:Int32 => return x + y}
}

func foo_array(): Array<Int64> {
    return @{1,2,3}
}

func foo_tuple(): Float64*String{
    return (3.1415,"PIE")
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