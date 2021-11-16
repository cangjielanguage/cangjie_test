// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base{
    var a: Int32 = 3
}

class Data<T> <: Base{
    var aa: Int32 = 2
    init(y: T){}
    func f(){
        return super.a + 3
    }
}

func run(): Int64 {
    let data: Data<Int32> = Data<Int32>(0)
    var res: Int32 = data.f()
    if (res == 6) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}