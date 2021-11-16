// EXEC-1: %compiler %cmp_opt %f -o %output

record E{
    var a : Int64 = 1
}
func main() {
    var i : ?E = E()
    i?.a = 0 // EXPECTED: regex .*cannot assign to value which is an initialized 'let' constant
    return (i?.a ?? -1)  -1
}
