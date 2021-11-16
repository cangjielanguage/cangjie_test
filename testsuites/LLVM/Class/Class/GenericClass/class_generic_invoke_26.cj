// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base{
    var a: Int32 = 3
}
class Data<T> <: Base{
    var aa: Int32 = 2
    var b: Int32 = 0
    init(){
        b = super.a + 1
    }
    init(y: T){}
}

func run(): Int64 {
    let data: Data<Int32> = Data<Int32>()
    var res1: Int32 = data.aa
    var res2: Int32 = data.b
    if (res1 == 2 && res2 == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}