// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

func main(): Int64 {
    if ( test() != 5){
        return 1
    }
    return 0
}

func test(){
    var a:Map<Coo,Int64> = #{Coo(1):5,Coo(2):10} // EXPECTED: regex error.*?generics type arguments do not match the constraint
    var b =  a.get(Coo(1))
    return match (b){
        case Some(x) => x
        case None => 100
    }
}

var res:UInt64 = 0
class Coo <:  Equatable{
    var x:Int64
    init(x:Int64){this.x = x}

    operator func ==(right : Coo) : Bool {
        return true
    }
    operator func !=(right : Coo) : Bool {
        return false
    }
}