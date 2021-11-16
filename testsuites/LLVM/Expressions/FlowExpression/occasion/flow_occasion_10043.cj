// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func a(input:Bool):Bool{input}


func main(): Int64 {
    match (1) {
        case _ if (true|>a) => 1
        case _ => 0
    }
    match (1) {
        case _ if (true|>(a~>a)) => 1
        case _ => 0
    }
    return 0
}
