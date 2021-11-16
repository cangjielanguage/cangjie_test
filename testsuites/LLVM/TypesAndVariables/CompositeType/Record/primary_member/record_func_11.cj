// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

record Data {
    var w: Int32
    var l: Int32

    Data(x:Int32, y: Int32){
        w = x
        l = y
    }

    operator func -(): Data{
        Data(this.w-1, this.l-1)
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
