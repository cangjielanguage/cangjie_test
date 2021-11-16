// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface Ioo {
    func plus(a: Int32): Int32 {
        var b = match (a){
            case x:Int32 => Int32(1)
            case _ => Int32(0)
        }
        a+b
    }
}

class Coo <: Ioo{}

func main(): Int64 {
    var a = Coo().plus(1)
    if ( a != 2 ){
        return 1
    }
    return 0
}