// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    return run()
}

class Data<T>{
    var width: T
    init(widthin: T){
        var i: Int32 = 32
        width = i   //EXPECTED: regex type incompatible in this assignment
    }
}

func run(): Int64 {
    var a: Int32 = 3
    let data: Data = Data<Int32>(a)
    return 0
}
