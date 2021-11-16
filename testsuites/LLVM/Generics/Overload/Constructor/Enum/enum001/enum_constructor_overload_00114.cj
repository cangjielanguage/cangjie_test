// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum B<X>{a}

enum A<X,Y>{a}

func main():Int64{
    var j = a<Int64,Int64>
    var res_j : Int64 = match (j) {
        case _ : A<Int64,Int64> => 0
        case _ => 1
    }
    return res_j
}