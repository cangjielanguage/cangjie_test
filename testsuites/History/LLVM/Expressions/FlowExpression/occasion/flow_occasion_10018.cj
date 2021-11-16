// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func a(input:Bool):Bool{input}
interface A{
    let x = true|>a
    let y = a~>a
}


func main(): Int64 {
    
    
    return 0
}
