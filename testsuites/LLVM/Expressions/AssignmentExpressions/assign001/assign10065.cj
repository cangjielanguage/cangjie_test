// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


interface RA{
  let a : Int32 = 2
}
func main(): Int64 {
    var l_a : Int32*Int32 = (4,4)
    
    l_a[0] = RA.a  // EXPECTED: regex 'tuple element' can not be assigned
    if (l_a[0] == Int32(2)) {
        return 0
    }
    return 1
}
