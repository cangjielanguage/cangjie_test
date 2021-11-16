// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


open class Base<T> {
    var a: Int32 = 2
}

class Data<T> <: Base<T> {
    var aa: Int32 = 3
}

func foo(x: Base<Int32>): Int32{
    return x.a
}

func main(): Int64 {
    var data: Data<Int32> = Data<Int32>()
    var res: Int32 = foo(data) // Data->Base
    if(res == 2){
        return 0
    }
    return 1
}
