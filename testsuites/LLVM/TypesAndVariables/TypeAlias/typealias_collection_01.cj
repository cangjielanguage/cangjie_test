// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type str = String
type float = Float64

func main(): Int64 {
    let list1: List<str> = ["pi="]
    var list2: List<float> = [3.1415]
    let str1: String = list1[0] + list2[0].toString()
    if (str1 == "pi=3.141500" || str1 == "pi=3.1415") {
        return 0
    }
    return 1
}
