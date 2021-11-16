// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum E{
    e
}
func main() {
    var i : ?E = e
    return 0
}