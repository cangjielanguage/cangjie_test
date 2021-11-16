// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


open class A{}
class B <: A{}

enum AA{a(()->A)}
enum BB{a(()->B)}

func main():Int64{
    var j = a( {  => A()})
    var res_j : Int64 = match (j) {
        case _ : AA => 0
        case _ => 1
    }
    return res_j
}