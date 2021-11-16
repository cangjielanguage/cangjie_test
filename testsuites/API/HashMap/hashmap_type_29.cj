// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f


from std import collection.*
func main(): Int64 {
    var f = test()
    if ( test() != 10){
        return 1
    }
    return 0
}

func test(){
    var a:HashMap<Coo,Int64> = HashMap<Coo,Int64>([(Boo(1),5),(Coo(2),10)]) // EXPECTED: regex error.*?return type for 'init' is mismatched
    var b =  a.get(Coo(2))
    return match (b){
        case Some(x) => x
        case $None => 100
    }
}

class Coo <: Boo & Equatable<Coo>{
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
        return this.x == right.x
    }
    operator func !=(right : Boo) : Bool {
        return false
    }
    func toString():String {

        return this.x.toString()
    }
}