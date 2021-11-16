// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func a(input:Int64):Int64{input}


func main(): Int64 {
    (1,1)[0]|>a
    
    return 0
}
