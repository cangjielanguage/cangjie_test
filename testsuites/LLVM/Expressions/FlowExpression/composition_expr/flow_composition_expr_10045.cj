// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



class B{
    operator func ()(input:B){}
}

class A{
    var a = B()
    func test(){
        this.a |> this.a
    }
}

func main(): Int64 {
    A().test()
    return 0
}
