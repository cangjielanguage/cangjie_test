// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A{
    var b : Int64 = 0
    func a(input:Int64){input}
}

class B <: A{
    func test(){
        super.b |> super.a
    }
}

func main(): Int64 {
    return B().test()
}
