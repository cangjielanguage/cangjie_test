// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main() {
    let al : ArrayList<Int64> = ArrayList<Int64>([1,2,3,4,5].toArray())
    let arr : RefArray<Int64> = RefArray<Int64>(al)
    var s1 = arr[2..]
    var s2 = arr[..:-1]     // EXPECTED: regex error.*the value of 'step' cannot be set without start or stop for slicing
    return 0
}
