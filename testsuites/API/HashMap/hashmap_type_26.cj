// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
func main(): Int64 {
    if ( test() != 1){
        return 1
    }
    return 0
}

func test(){
    var a:HashMap<Boo,Int64> = HashMap<Boo,Int64>(5,{x:Int64=>(Coo(x),1)})
    var b =  a.get(Coo(1))
    return match (b){
        case Some(x) => x
        case None => 100
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