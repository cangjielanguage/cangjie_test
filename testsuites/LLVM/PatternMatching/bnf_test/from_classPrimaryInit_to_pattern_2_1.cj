// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Boo{
    var a:Int64 = 0
    func get(){
        return a
    }
    Boo(x!:Int64=match (1){ case _ => 1}){ a  = x}
}

func main(): Int64 {
    var a = Boo().get()
    if ( a != 1 ){
        return 1
    }
    return 0
}