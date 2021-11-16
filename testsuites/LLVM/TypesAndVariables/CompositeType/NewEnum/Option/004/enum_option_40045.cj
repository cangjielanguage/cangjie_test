// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum E{
    e
    func a(){}
}
func main() {
    var i : ?E = E.e
    i?.a = {} // ASSERT: scan 'func' can not be assigned
    return -1
}