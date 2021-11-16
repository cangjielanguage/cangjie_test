// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() {
    var map01 = #{1: 'a', 3: 'b', 2: 'c'}
    for (item in map01) {
        if (item[1] == 'c' ) {
            return 0
        }
    }
    return 1
}
