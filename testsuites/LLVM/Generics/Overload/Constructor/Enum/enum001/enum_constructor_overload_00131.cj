// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class C{}
class D <: C{}
enum A{a(()->C)}
enum B{a(()->D)}

func main():Int64{
    var j = a({=> C()}) 
    var res_j : Int64 = match (j) {
        case _ : A => 0
        case _ => 1
    }
    return res_j
}
