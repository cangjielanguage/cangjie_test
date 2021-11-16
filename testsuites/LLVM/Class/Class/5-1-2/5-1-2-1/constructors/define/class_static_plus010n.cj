// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    return run()
}

class Data {
    static let width: Int32
    static let length: Int32
    init(x:Int32, y: Int32){
        width = x
        length = y
    }

}
func run(): Int64 {
    var data: Data = Data(3,4)
    return 0
}
