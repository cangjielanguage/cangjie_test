// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : ?Char = 'a'
    match (a) {
        case _ : Option<Char> => 0
        case _ => 1
    }
}
