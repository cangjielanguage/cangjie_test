// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

// 无间隔符使用*listEpr
func main(): Int64 {
    let a = [*[1,2,3]*[1,2],[3]]  // EXPECTED: regex invalid binary operator '\*' on type 'Class-List<Int64>' and 'Class-List<Int64>'
    if (a.get(2) == 3) {
        return 0
    }
    return 1
}
