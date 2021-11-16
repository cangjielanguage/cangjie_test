// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import collection.*
func main(): Int64 {
    if ( test() != 0){
        return 1
    }
    return 0
}
func test(){
    var a:HashMap<Coo<Int64,Int32>,Int64> = HashMap<Coo<Int64,Int32>,Int64>(1,{x:Int64=>(Coo<Int64,Int32>(x),1)})
    var b =  a.get(Coo<Int64,Int32>(0))
    return match (b){
        case Some(x) => x
        case None => 100
    }
}
var res:UInt64 = 0
class Coo<K,V> <: HashMap<K,V>  & Hashable & Equatable<Coo<K,V>> where K <: Hashable, K <: Equatable<K> { //EXPECTED: regex error.*?super class 'HashMap' is not inheritable, use 'open' modifier instead
    var x:Int64
    init(x:Int64){this.x = x }
    func hashCode() : UInt64 {
        res++
        return res
    }
    operator func ==(right : Coo<K,V> ) : Bool {
        return this.x == right.x
    }
    operator func !=(right : Coo<K,V> ) : Bool {
        return false
    }
}