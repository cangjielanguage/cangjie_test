// EXEC-PIPE-1: %compiler %frontend %cmp_opt %typecheck %f 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(){
    var b = List<Int64*Int64>([(1,2),(3,4)])
    print("${b}")  // EXPECTED: regex the type 'Class-List<Tuple<Int64, Int64>>' should implement interface 'ToString' in the 'core' package
    return 0
}
