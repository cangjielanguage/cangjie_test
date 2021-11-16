// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait TEST{
    func foo(a:This,b:ArrayList<This>):This
}

append Int64 with TEST{
    func foo(a:Int64,b:ArrayList<Int64>):Int64{return a}
}

func main(): Int64 {
    return 0
}