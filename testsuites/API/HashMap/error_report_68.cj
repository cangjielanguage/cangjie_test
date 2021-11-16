// EXEC-PIPE-1:%compiler %frontend %typecheck %stdx_cmp_opt %f 2>&1 | compare %f

from std import collection.*
func foo<T>(){}

func main() {
    let a:HashMap<Int64,Int64> = HashMap<Int64,Int64>([(1,1),(2,2),(3,3)])
    var tup = (1,1)
    var b = 1
    match (b) {
        case in $a => "success" // EXPECTED: regex-auto unsupported type 'HashMap' for 'in pattern' in match case.
        case _ => "FAILED"
    }
    return 0
}
