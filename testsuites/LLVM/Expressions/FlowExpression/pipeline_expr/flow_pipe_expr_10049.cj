// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class A{
    var b : Int64 = 0
    func a(input:Int64){input}
    func test(){
        this.b |> this.a
    }
}

func main(): Int64 {
    return A().test()
}
