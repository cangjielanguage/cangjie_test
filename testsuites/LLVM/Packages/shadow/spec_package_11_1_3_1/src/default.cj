// DEPENDENCE: p1 p2
// EXEC: %compiler %cmp_opt -c p1/file1.cj -o p1.%middle
// EXEC: %compiler %cmp_opt -c p2/*.cj  p1.%middle -o p2.%middle
// EXEC: %compiler %cmp_opt %f p1.%middle p2.%middle -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    return 0
}
