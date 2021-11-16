// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


abstract class Base<T> {
    func foo(): Int32
}

class Data<T> <: Base<Int32> {
    func foo(): Int32{
        return 3
    }
}

func main(): Int64 {
    var data: Data<Int32> = Data<Int32>()
    var res: Int32 = data.foo()
    if(res == 3){
        return 0
    }
    return 1
}