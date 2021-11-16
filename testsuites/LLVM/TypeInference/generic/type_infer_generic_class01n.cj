// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func test_class(){
    var c = Data<Int32>(1)
    var d = Data<Data<Int64>>(c) // EXPECTED: regex no matching constructor for call
}

class Data<T>{
    var a:T
    init(x:T){ a = x }
}

func run():Int64{
    test_class()
    return 0
}
func main(): Int64 {
    return run()
}


