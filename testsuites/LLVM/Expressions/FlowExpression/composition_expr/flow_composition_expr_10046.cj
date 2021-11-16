// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



class B{
    operator func ()(input:B){}
}

open class C{
    var a = B()
}

class A <: C{
    func test(){
        super.a |> super.a
    }
}

func main(): Int64 {
    A().test()
    return 0
}
