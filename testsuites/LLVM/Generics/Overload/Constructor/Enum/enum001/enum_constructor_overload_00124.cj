// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum B{a(Int32)}

enum A{a(Int16)}

func main():Int64{
    var j : A = a(1)
    var res_j : Int64 = match (j) {
        case _ : A => 0
        case _ => 1
    }
    return res_j
}