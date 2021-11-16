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
    var a:HashMap<Coo,Int64> = HashMap<Coo,Int64>(5,{x:Int64=>(Coo(x),1)})
    var b =  a.get(Coo(1))
    return match (b){
        case Some(x) => x
        case None => 100
    }
}

var res:UInt64 = 0
class Coo <: Hashable & Equatable<Coo>{
    var x:Int64
    init(x:Int64){this.x = x}
    func hashCode() : UInt64 {
        res++
        return UInt64(x)
    }
    operator func ==(right : Coo) : Bool {
        return this.x == right.x
    }
    operator func !=(right : Coo) : Bool {
        return false
    }
}