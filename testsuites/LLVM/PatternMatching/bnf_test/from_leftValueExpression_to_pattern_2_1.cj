// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

let b = Array<Int64>([1, 1, 1])

func main(): Int64 {
    match (1){ case _ => b}[1] = 2 // EXPECTED: regex error.*illegal left value
    if ( b[1] != 2 ){
        return 1
    }
    return 0
}
