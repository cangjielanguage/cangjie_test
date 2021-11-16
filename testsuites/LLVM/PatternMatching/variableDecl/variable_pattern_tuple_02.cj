// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

//	DTS202105240NPPUMP0F00
func main() : Int64 {
    var (a,b):Int32=(1,2) // EXPECTED: regex error.*?initializer's type is incompatible with those irrefutable pattern declarations
    return 0
}
