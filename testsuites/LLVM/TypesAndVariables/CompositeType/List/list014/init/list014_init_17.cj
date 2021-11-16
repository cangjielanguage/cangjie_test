// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan parameters and arguments mismatch
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
from std import collection.*
func main(){
    var a = Buffer<Int64>(2,{i=>i})
    var b = List<Char>(a)
    return 1
}
