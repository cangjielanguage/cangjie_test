// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum B<T>{a}

trait TR{func test(a:This):Unit}
append Int64 with TR{func test(a:Int64){}}

enum A<T> where T <: TR{a}

func main():Int64{
    var j = a<Int64>
    var res_j : Int64 = match (j) {
        case _ : A<Int64> => 0
        case _ => 1
    }
    return res_j
}