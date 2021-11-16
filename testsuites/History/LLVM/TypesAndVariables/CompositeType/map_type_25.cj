// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

//DTS202106230Q9Z3GP1200
func main(): Int64 {
    if ( test() != 100){
        return 1
    }
    return 0
}

func test(){
    var a:Map<Coo,Int64> = Map<Coo,Int64>(5,{x:Int64=>(Coo(x),1)})
    var b =  a.get(Coo(1))
    return match (b){
        case Some(x) => x
        case $None => 100
    }
}

var res:UInt64 = 0
class Coo <: Hashable & Equatable<Coo>{
    var x:Int64
    init(x:Int64){this.x = x}
    func hashCode() : UInt64 {
        res++
        return res
    }
    operator func ==(right : Coo) : Bool {
        return true
    }
    operator func !=(right : Coo) : Bool {
        return false
    }
}
