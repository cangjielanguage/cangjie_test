// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Data<T> {
    var a: Int32 = 2
    var b: Int32 = 0
    init(){
        b = this.a + 2
    }
    init(y: T){}
}

func run(): Int64 {
    let data: Data<Int32> = Data<Int32>()
    var res1: Int32 = data.a
    var res2: Int32 = data.b
    if (res1 == 2 && res2 == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}