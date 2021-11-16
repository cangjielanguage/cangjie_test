// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func a(input:Bool):Bool{input}
func b(input:Int64){1..10}


func main(): Int64 {
    for (i in 1|>b) {true|>a}
    for (i in 1|>b) {a~>a}
    return 0
}
