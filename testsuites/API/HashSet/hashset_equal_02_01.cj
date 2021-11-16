// EXEC-PIPE-1: %compiler %stdx_cmp_opt %f -o %output 2>&1 | compare %f

from std import collection.*

func main(): Int64 {
    var str1:List<String> = ["1","2"]
    var str2:List<Int64> = [1,2]
    var r1:HashSet<String> = HashSet<String>(str1)
    var r2:HashSet<Int64> = HashSet<Int64>(str2)
    if (r1==r2)  // EXPECTED: regex error.*?invalid binary operator '==' on type 'Class-HashSet<Record-String>' and 'Class-HashSet<Int64>'
    {
        return 1
    }
    return 0
}
