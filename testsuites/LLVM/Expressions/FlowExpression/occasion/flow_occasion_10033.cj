// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func a(input:Bool):Bool{input}


func main(): Int64 {
    while (false|>a) {false|>a}
    while (false|>a) {a~>a}
    return 0
}
