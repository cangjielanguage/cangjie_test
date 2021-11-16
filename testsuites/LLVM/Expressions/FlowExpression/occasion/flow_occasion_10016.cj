// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func a(input:Bool):Bool{input}


func main(): Int64 {
    var x = true|>a
x = false|>a
    var y = a~>a
y = a~>a
    return 0
}
