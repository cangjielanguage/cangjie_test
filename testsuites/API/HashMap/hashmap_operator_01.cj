// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

func main(): Int64 {
    var a : HashMap<Coo,Int64> = HashMap<Coo,Int64>()
    var m = Coo(1)
    a[m] = 1
    a[m] += 1
//    a[m] = a[m] + 1
    if (a[m] != 2) {
        return 1
    }
    return 0

}

var res:UInt64 = 0
class Coo <: Hashable & Equatable<Coo>{
    var x : Int64
    init(x : Int64) {this.x = x}
    func hashCode() : UInt64 {
        return UInt64(x)
    }
    operator func ==(right : Coo) : Bool {
        var a = (this.x == right.x)
        if (a) {
            return true
        } else {
            return false
        }
    }
    operator func !=(right : Coo) : Bool {
        var a = (this.x == right.x)
        if (!a) {
            return true
        } else {
            return false
        }
    }
}

