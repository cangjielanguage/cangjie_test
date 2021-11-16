// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A{
    private let a : (Int64)->Int64 = { input:Int64 => input}

    private let b : (Int64)->Int64 = { input:Int64 => input}

    private let c : ((Int64)->Int64) ->Int64 = { input:(Int64)->Int64 => input(1)}

    init() {}

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
