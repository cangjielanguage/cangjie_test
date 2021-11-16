// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a1 = Array<Int8>([])

a1.sortDescending()

func main(): Int64 {
    
    return a1.size()
}
