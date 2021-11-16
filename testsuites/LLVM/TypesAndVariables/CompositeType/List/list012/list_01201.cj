// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// 字面量测试spread机制
func main(): Int64 {
    var a = [3,4]
    var b = [1,2,*a,5,6]
    if (b[2] == 3) {
        return 0
    }
    return 1
}
