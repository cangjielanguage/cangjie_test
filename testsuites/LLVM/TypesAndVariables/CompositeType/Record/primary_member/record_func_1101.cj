// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

record Data {
    static let width: Int32 = 10
    static let length: Int32 = 20
//    let width: Int32 = 10
//    let length: Int32 = 20
    var w: Int32
    var l: Int32

    Data(x:Int32, y: Int32){
        w = x
        l = y
    }

    operator func -(): Data{
        var left: Int32 = width - 1
        var right: Int32 = length - 1
        print("label width :" + left.toString() + "\n")
        print("label length :" + right.toString())
        Data(left, right)
    }
}

func run(): Int64 {
    var a: Int32 = 3
    var b: Int32 = 4
    var data: Data = Data(a, b)
    var d1 = -data
    var res1: Int32 = d1.w
    var res2: Int32 = d1.l
    if (res1 == 9 && res2 == 19) {
        return 0
    }
    return 1
}
