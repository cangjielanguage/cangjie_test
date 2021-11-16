// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args

// check no return key word
func a() {
    var x : Int32 = 1
    x = 1 + 2
}

func main(): Int64 {
    var x = a()
    var typecheck: Int64 = match(x){
        case _: Unit => 0
        case _ => 1
    }
    return typecheck
}