// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f


func main(): Int64 {
    if ( test() != 1){
        return 1
    }
    return 0
}

func test(){
    var a:Map<Coo,Int64> = Map<Coo,Int64>(5,{x:Int64=>(Boo(x),1)}) // EXPECTED: regex error.*?return type mismatch
    var b =  a.get(Coo(1))
    return match (b){
        case Some(x) => x
        case None => 100
    }
}

var res:UInt64 = 0
class Coo <: Boo & Hashable & Equatable<Coo> {
    var y:Int64
    init(x:Int64){
        super(x)
        this.y = x
    }
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

open class Boo {
    var x:Int64
    init(x:Int64){this.x = x}

}