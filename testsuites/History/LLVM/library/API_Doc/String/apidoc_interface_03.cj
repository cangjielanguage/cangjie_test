// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a = Aoo(1)
    var b = Aoo(2)
    if ( a == b ){
        return 1
    }
    if ( a != b ){
        return 0
    }
    return 3
}

class Aoo <: Equatable<Aoo>{
    var a : Int64 = 0
    init(x:Int64){
        a =x
    }
    operator func == (that:Aoo):Bool{
        if ( that.a == this.a ){
            return true
        } else {
            return false
        }
    }
    operator func != (that:Aoo):Bool{
        if ( that.a != this.a ){
            return true
        } else {
            return false
        }
    }

}
