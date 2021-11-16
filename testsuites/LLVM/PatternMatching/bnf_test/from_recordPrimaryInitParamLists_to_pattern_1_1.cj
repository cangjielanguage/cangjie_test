// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Boo{
    var a:Int64 = 0
    var b:Int64 = 0
    func get(){
        return a + b
    }
    Boo(y:Int64,x!:Int64=match (1){ case _ => 1}){ b = y;a  = x}
}

func main(): Int64 {
    var a = Boo(1).get()
    if ( a != 2 ){
        return 1
    }
    return 0
}