// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum B<X>{a(X,X)}

enum A<X>{a(X)}

func main():Int64{
    var j = a(1)
    var res_j : Int64 = match (j) {
        case _ : A<Int64> => 0
        case _ => 1
    }
    return res_j
}
