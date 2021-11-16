// DEPENDENCE: range00105a import.conf
// EXEC: %compiler %cmp_opt -c range00105a/range00105a.cj -o range00105a.%middle && %copycharjs range00105a
// EXEC: %compiler %cmp_opt %f range00105a.%middle -o %output
// EXEC: %run %run_opt %output %run_args
import range00105a.a
func main(): Int64 {
    for (i in a) {
      print("a")
    }
    return 0
}
