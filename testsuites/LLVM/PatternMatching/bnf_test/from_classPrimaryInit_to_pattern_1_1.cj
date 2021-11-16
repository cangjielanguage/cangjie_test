// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Boo{
    var a:Int64 = 0
    func foo(x:Int64){
        return x + a
    }
    init(x:Int64){ a  = x}
}
class Coo <: Boo{
    Coo(){
        super(match (1){ case _ => 1})
    }
}

func main(): Int64 {
    var a = Coo().foo(1)
    if ( a != 2 ){
        return 1
    }
    return 0
}