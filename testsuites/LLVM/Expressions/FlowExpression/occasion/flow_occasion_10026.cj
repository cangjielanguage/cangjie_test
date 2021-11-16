// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func a(input:Int64):Int64{input}


func main(): Int64 {
    Int32(1|>a)
    Int32(1|>(a~>a))
    return 0
}
