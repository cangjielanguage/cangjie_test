// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import collection.*
func main():Int64 {
    var a:HashMap<Boo,Int64> = HashMap<Boo,Int64>(5,{x:Int64=>(Coo(x),1)}) // EXPECTED: regex error.*?generics type arguments do not match the constraint
    return 0
}

open class Boo <: Equatable<Boo>{
    var x:Int64
    init(x:Int64){this.x = x}
    operator func ==(right : Boo) : Bool {
        return this.x == right.x
    }
    operator func !=(right : Boo) : Bool {
        return false
    }
}
