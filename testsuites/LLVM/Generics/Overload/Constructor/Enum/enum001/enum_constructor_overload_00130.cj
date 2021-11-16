// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class C{}
class D <: C{}
enum A{a(()->C)}
enum B{a(()->D)}

func main():Int64{
    var j = a({=> D()}) // EXPECTED: regex error.*find multiple constructor 'a' of enum declaration
    var res_j : Int64 = match (j) {
        case _ : B => 0
        case _ => 1
    }
    return res_j
}
