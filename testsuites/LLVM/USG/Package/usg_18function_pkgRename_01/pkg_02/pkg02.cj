
//DEPENDENCE: ../pkg_01
// EXEC: %compiler %cmp_opt -c pkg_01/pkg01.cj -o pkg_01.%middle
// EXEC: %compiler %cmp_opt %f pkg_01.%middle -o %output
// EXEC: %run %run_opt %output %run_args

package pkg_02

import pkg_01.foo as f1    

func foo() {return 2}

var result1 = f1()
var result2 = foo()


func main(): Int64{
    return result1  - result2
}
