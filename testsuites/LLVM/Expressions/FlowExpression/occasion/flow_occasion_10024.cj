// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func a(input:Int64):Int64{input}
func b<T>(input:T):T{input}


func main(): Int64 {
    b(1|>a)
    b(a~>a)
    return 0
}
