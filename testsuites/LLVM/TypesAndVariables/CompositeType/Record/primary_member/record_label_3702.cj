// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


func main(): Int64 {
    return run()
}
func run(): Int64 {
    let width: Int32 = 1
    let length: Int32 = 2
    let perimeter2 : () -> Int32 = {  => var res:Int32=0;return res}
    var date: Date = Date()
    var day: Day = Day()
    var time: Time = Time()
    var time2: Time2 = Time2()
    var time3: Time3 = Time3()
    return 0
}

record Date{
    let width: Int32 = 1
    let length: Int32 = 2
    let perimeter2 : () -> Int32 = {  => var res:Int32=0;return res} // coredumped :Cangjie::GenerateModule
    init() {}
}

record Day{
    let width: Int32 = 1
    let length: Int32 = 2
    let perimeter2 : () -> Int32 = {  => var res:Int32=0; res} // 报错：[Error] :0:0: type of default argument value is not match to expected type '() -> Int32'
    init() {}
}


record Time{
    let width: Int32 = 1
    let length: Int32 = 2
    let perimeter2 : () -> Int32 = {  => width}  // EXPECTED: regex 'width' is not allowed to be accessed before all member variables are initialized
    init() {}
}

record Time2{
    let width: Int32 = 1
    let length: Int32 = 2
    let perimeter2 : () -> Int32 = {  => 4}  // 报错： [Error] :0:0: type of default argument value is not match to expected type '() -> Int32'
    init() {}
}

record Time3{
    let width: Int32 = 1
    let length: Int32 = 2
    let perimeter2 : () -> Int64 = {  => 4}  // coredump：Cangjie::GenerateModule
    init() {}
}

