// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

let tuple = (1, 2, 3)
let t1 = Option<Int64*Int64*Int64>.Some(tuple)

func main() {
    t1?[0] = 10 // ASSERT: scan 'tuple element' can not be assigned
    return 0
}