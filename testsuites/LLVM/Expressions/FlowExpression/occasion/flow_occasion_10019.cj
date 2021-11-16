// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func a(input:Bool):Bool{input}
var x = true|>a
var y = a~>a


func main(): Int64 {
    
    
    return 0
}
