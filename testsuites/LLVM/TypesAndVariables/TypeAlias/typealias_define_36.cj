// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type ch<T> = Char

func main(): Int64 {
    var c1: ch<Int8> = '汉'
    var c2: Char = '字'
    var res: String = c1.toString() + c2.toString()
    if (res == "汉字") {
        return 0
    }
    return 1
}