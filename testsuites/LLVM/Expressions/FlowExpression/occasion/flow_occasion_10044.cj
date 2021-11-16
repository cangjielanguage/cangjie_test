// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func a(input:Bool):Bool{input}


func main(): Int64 {
    "${true|>a}"
    "${true|>(a~>a)}"
    return 0
}
