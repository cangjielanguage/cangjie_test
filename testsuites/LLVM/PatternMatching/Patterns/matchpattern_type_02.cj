// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    let a = Aoo()
    var res:Int64  = match (a) {
        case x:Boo => x.boo()
        case x:Aoo => x.aoo()-1
        case _ => 2
    }
    return res
}

open class Aoo{
    var a = 1
    func aoo(){ return a}
}
class Boo <: Aoo {
    var b = 1
    func boo(){ return b}
}