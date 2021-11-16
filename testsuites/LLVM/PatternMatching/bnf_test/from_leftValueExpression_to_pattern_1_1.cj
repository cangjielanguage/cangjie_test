// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


let b = Array<Int64>([1, 1, 1])

func main(): Int64 {
    b[match (1){ case _ => 1}] = 2
    if ( b[1] != 2 ){
        return 1
    }
    return 0
}