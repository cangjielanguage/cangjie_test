// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

record Data {
    let width: Int32
    let length: Int32

    Data(x:Int32, y: Int32){
        width = x
        length = y
    }

    operator func ==(oprRight: Data): Bool{
        if (this.width == oprRight.width && this.length == oprRight.length){
            return true
        }
        return false
    }
}

func run(): Int64 {
    var a: Int32 = 3
    var b: Int32 = 4
    var data1: Data= Data(a, b)
    var data2: Data= Data(a, b)
    var res =  data1 == data2
    if (res) {
        return 0
    }
    return 1
}
