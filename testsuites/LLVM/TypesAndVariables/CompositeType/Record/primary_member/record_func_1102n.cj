// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

record Data {
    var w: Int32 = 10
    var l: Int32 = 20

    Data(x:Int32, y: Int32){
        w = x
        l = y
    }

    operator func -(): Data{
        var left: Int32 = w - 1
        var right: Int32 = l - 1
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
    if (res1 == 2 && res2 == 3) {
        return 0
    }
    return 1
}
