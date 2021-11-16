// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


open class Base<T> {
    var a: Int32 = 2
}

class Data<T> <: Base<T> {
    init(){
        super()
        a = 3
    }    
}

func main(): Int64 {
    var data: Data<Int32> = Data<Int32>()
    var castOP = data as Base<Int32> // Data->Base
    var res: Int32 = data.a
    if(res == 3){
        return 0
    }
    return 1
}
