// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

record Data {
    let width: Int32
    let length: Int32

    init(x:Int32, y: Int32){
        width = x
        length = y
    }

    public operator func -(): Data{
        Data(this.width-1, this.length-1)
    }
}

func run(): Int64 {
    var a: Int32 = 3
    var b: Int32 = 4
    var data: Data = Data(a, b)
    var d1 = -data
    var res1: Int32 = d1.width
    var res2: Int32 = d1.length
    if (res1 == 2 && res2 == 3) {
        return 0
    }
    return 1
}