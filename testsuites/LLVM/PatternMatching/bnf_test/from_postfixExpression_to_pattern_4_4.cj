// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var c =  -(match(1){case _ =>A().a}[1])
    if ( c != -1){
        return 1
    }
    return 0
}

class A{
    var a:Array<Int64> = Array<Int64>([0, 1, 2])
}