// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    return run()
}

class Data<T, V>{
    let width: T
    let length: V
    init(widthin: Int32){
        width = widthin  //EXPECTED: regex type incompatible in this assignment
        length = width
    }

}

func run(): Int64 {
    var a: Int32 = 3
    let data: Data = Data<Int32>(a)
    return 0
}
