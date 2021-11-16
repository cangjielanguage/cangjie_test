// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var x = {=>0}
    let c1 = Option<()->Int64>.Some(x)
    var res : Int64 = c1?() // EXPECTED: regex no matching enum constructor 'Some' for given arguments
    return 0
}
