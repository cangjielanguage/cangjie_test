// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
trait X{
    func asFunc(a:This,b:This):This
}

append Int64 with X{
    func asFunc(a:Int64,b:Int64):Int64{a}
}

func main(): Int64 {
    return 1 |> 1 - 1
}
