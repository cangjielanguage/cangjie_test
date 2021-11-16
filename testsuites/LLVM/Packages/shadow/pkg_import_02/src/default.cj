// DEPENDENCE: pkga
// EXEC: %compiler %cmp_opt -c pkga/* -o pkga.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.*

func main(): Int64 {
    return 0
}