// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A{}

func main(): Int64 {
    var a : ?A = A()
    match (a) {
        case _ : Option<A> => 0
        case _ => 1
    }
}
