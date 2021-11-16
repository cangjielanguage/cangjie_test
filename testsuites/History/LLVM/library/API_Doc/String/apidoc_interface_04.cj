// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( Aoo(1) > Aoo(2) ){
        return 1
    }
    if ( Aoo(2) < Aoo(1) ){
        return 2
    }
    if ( Aoo(2) <= Aoo(1) ){
        return 3
    }
    if ( Aoo(1) >= Aoo(2) ){
        return 4
    }
    if ( Aoo(1) >= Aoo(1) && Aoo(1) <= Aoo(1) ){
        return 0
    }
    return 3
}

class Aoo <: Comparable<Aoo>{
    var a : Int64 = 0
    init(x:Int64){
        a =x
    }
    operator func > (that:Aoo):Bool{
        if ( this.a > that.a ){
            return true
        } else {
            return false
        }
    }
    operator func < (that:Aoo):Bool{
        if ( this.a < that.a ){
            return true
        } else {
            return false
        }
    }
    operator func >= (that:Aoo):Bool{
        if ( this.a >= that.a ){
            return true
        } else {
            return false
        }
    }
    operator func <= (that:Aoo):Bool{
        if ( this.a <= that.a ){
            return true
        } else {
            return false
        }
    }
}
