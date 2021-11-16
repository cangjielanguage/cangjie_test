// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func a(input:UInt32):UInt32{input}


func main(): Int64 {
    chr(1|>a)
    
    return 0
}
