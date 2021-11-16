// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func a(input:Char):Char{input}


func main(): Int64 {
    ord('1'|>a)
    
    return 0
}
