// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type Lis = List<Int32>

func main(): Int64 {
    var list1: Lis = [1, 2, 3]
    var list2: List<Int32> = [10, 20]
    var res: Int32 = list1[0] + list1[1] + list1[2] + list2[0] + list2[1]
    print(res.toString())
    if (res == 36) {
        return 0
    }
    return 1
}