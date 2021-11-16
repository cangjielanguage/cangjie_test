// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

//DTS202106230Q9Z3GP1200
func main(): Int64 {
    if ( test() == 1){
        return 1
    }
    return 0
}

func test(){
    var a:Map<Coo<Int32,Int64>,Int64> = Map<Coo<Int32,Int64>,Int64>(5,{x:Int64=>(Coo<Int32,Int64>(x),1)})
    var b =  a.get(Coo<Int32,Int64>(1))
    return match (b){
        case Some(x) => x
        case $None => 100
    }
}

var res:UInt64 = 0
class Coo<K,V> <: Hashable & Equatable<Coo<K,V>>{
    var x:Int64
    init(x:Int64){this.x = x}
    func hashCode() : UInt64 {
        res++
        return res
    }
    operator func ==(right : Coo<K,V>) : Bool {
        return true
    }
    operator func !=(right : Coo<K,V>) : Bool {
        return false
    }
}
