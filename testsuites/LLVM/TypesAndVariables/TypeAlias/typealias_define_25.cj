// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type Tuple = Float16*UInt32*Int8*String

func main(): Int64 {
    var tpOne: Tuple = (3.14, 2 - 1, -1, "PIE")
    var tpTwo: Float16*UInt32*Int8*String = (3.14, 2 - 1, -1, "PIE")
    if (tpOne == tpTwo) {
        return 0
    }
    return 1
}