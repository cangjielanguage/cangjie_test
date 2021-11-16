// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Base{}
class Sub{}

enum X{a((Base)->Unit,Sub)}
enum Y{a((Sub)->Unit,Base)}
func g(a:Base):Unit{}
func g(a:Sub):Unit{}
func g(a:Int32):Unit{}


func main():Int64{
    var j = a(g,Sub())
    var res_j : Int64 = match (j) {
        case _ : X => 0
        case _ => 1
    }
    return res_j
}
