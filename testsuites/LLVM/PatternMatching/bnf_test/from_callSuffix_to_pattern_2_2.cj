// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var c = foo(x:{match(1){case _ =>1}})
    if ( c != 1) {
        return 1
    }
    return 0
}

func foo(x!:()->Int64 = {match(1){case _ =>2}} ){
    return x()
}