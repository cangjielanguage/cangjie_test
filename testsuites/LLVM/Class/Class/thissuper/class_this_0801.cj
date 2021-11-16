// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Data<T> {
    var a: T
    init(x: T, y: T){
        this.a = x
    }
    init(x: T){
        this(x, x)
        a = this.foo(x)
    }
    func foo(x: T): T{
        return x
    }
}

func run(): Int64 {
    var data: Data<Int32> = Data<Int32>(3)
    var res3: Int32 = data.a
    if (res3 == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
