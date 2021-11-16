// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

//DTS202106230Q9Z3GP1200
func main(): Int64 {
    if ( test() == 10){
        return 1
    }
    return 0
}

func test(){
    var a:Map<Boo,Int64> = #{Boo(1):5,Coo(2):10}
    var b =  a.get(Coo(2))
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
        return res
    }
    operator func ==(right : Boo) : Bool {
        return true
    }
    operator func !=(right : Boo) : Bool {
        return false
    }
}
