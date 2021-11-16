// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    return run()
}

class Data<T, V>{
    var width: T
    var length: V
    init(widthin: T, lengthin: V){
        width = widthin
        length = lengthin
    }
    func area(x: T): T{
        length = x  //EXPECTED: regex type incompatible in this assignment
        return width
    }

}

func run(): Int64 {
    var i1: Int32 = 3
    var i2: Int32 = 4
    let data: Data = Data<Int32>(i1, i2)
    return 0
}
