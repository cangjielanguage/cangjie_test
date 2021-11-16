// DEPENDENCE: ./test_20001.cj
// EXEC: %compiler %cmp_opt -c test_20001.cj -o test_20001.%middle
// EXEC: %compiler %cmp_opt %f test_20001.%middle -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

import test_20001.*

func main(){
    var res = test(100,100)
    print("success")
    return Int64(res) - 127
}
