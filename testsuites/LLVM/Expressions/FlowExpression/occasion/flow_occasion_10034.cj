// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func a(input:Bool):Bool{input}


func main(): Int64 {
    do {false|>a} while ((false)|>a)
    do {a~>a} while (false|>a)
    return 0
}
