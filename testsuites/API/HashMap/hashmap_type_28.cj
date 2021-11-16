// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

func main(): Int64 {
    if ( test() != 10){
        return 1
    }
    return 0
}

func test(){
    var f = Boo(1)
    var g = Coo(2)
    var a:HashMap<Boo,Int64> =HashMap<Boo,Int64>([(f,5),(g,10)])
    var b =  a.get(g)
    return match (b){
        case Some(x) => x
        case $None => 100
    }
}

class Coo <: Boo{
    var y:Int64
    init(x:Int64){
        super(x)
        this.y = x
    }
}

var res:UInt64 = 0
open class Boo <: Hashable & Equatable<Boo>{
    var x:Int64
    init(x:Int64){this.x = x}
    func hashCode() : UInt64 {
        res++
        return UInt64(x)
    }
    operator func ==(right : Boo) : Bool {
        return this.x == right.x
    }
    operator func !=(right : Boo) : Bool {
        return false
    }
}