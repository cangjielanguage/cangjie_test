// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A{
    var val = 1
    private func a(input:Int64):Int64{input}

    private func b(input:Int64):Int64{input}

    private func c(input:(Int64)->Int64):Int64{input(1)}

    func test(){
        1 |> a
        a~>b
        1 |> (a~>b)
        return (a ~> b |> c) - 1
    }
}


func main(): Int64 {
    return A().test()
}
