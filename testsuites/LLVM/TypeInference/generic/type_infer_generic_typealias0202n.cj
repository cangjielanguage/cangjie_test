// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

type A2<T> = Book<Array<T>>

record Book<T>{
    var a:T
    init(x:T){ a = x }
}

func run():Int64{
    var a:A2<Int64>
    return 0
}

func main(): Int64 {
    return run()
}
