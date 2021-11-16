// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func a(input:Bool):Bool{input}


func main(): Int64 {
    if (true|>a) {true|>a} else {true|>a}
    if (true) {a~>a} else {a~>a}
    return 0
}
