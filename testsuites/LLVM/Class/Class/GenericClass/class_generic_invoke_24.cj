// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Data<T> {
    var a: Int32 = 2
    init(y: T){}
    func f(){
        return this.a + 2
    }
}

func run(): Int64 {
    let data: Data<Int32> = Data<Int32>(0)
    var res: Int32 = data.f()
    if (res == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}