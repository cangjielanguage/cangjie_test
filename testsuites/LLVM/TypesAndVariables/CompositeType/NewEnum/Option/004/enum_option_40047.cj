// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan 'func' can not be assigned
record E{
    func a(){}
}
func main() {
    var i : ?E = E()
    i?.a = {}
    return -1
}