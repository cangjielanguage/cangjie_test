// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var b = Array<Int64>([1, 1, 1])

func foo(x:Array<Int64>){
    return x
}

func main(): Int64 {
    foo(match (1){ case _ => b})[1] = 2
    if ( b[1] != 2 ){
        return 1
    }
    return 0
}