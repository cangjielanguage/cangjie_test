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
    var a:HashMap<Coo<Int32,Int64>,Int64> = HashMap<Coo<Int32,Int64>,Int64>(5,{x:Int64=>(Coo<Int32,Int64>(x),1)})
    var b =  a.get(Coo<Int32,Int64>(1))
    return match (b){
        case Some(x) => x
        case None => 100
    }
}

var res:UInt64 = 0
class Coo<K,V> <: Hashable & Equatable<Coo<K,V>>{
    var x:Int64
    init(x:Int64){this.x = x}
    func hashCode() : UInt64 {
        res++
        return UInt64(x)
    }
    operator func ==(right : Coo<K,V>) : Bool {
        return true
    }
    operator func !=(right : Coo<K,V>) : Bool {
        return false
    }
}