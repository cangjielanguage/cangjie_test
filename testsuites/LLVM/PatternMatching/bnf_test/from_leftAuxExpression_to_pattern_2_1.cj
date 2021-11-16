// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Boo{
    var a = 0
    init(x:Int64){
        a = x
    }
    func foo(x:Int64){
        return x+1
    }
}

func main(): Int64 {
    var a = Boo(match (1){ case _ => 1}).a
    if ( a != 1 ){
        return 1
    }
    return 0
}