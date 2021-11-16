// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A{
    var a : Int64
    init(input:Int64){
        a = input
    }
}


func test(): Int64 {
    let a : List<A> = [A(1)]
    return a[0].a
}

func main(): Int64 {
    return test() - 1
}
