// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func foo(y:Int64,x!:Int64=match (1){ case _ => 1}){ return y + x}

func main(): Int64 {
    var a = foo(1)
    if ( a != 2 ){
        return 1
    }
    return 0
}