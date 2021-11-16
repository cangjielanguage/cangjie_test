// DEPENDENCE: a.cj a.cfg
// EXEC: %compiler %cmp_opt -c a.cj -o a.%middle
// EXEC: %compiler %cmp_opt %f  a.%middle -o %output
// EXEC: %run %run_opt %output %run_args
package pkg501
import a.*

func main():Int64{
    var i = a.test(1)
    var j = a.test(true)
    var k = a.test(Int32(2))
    if (i != 1) {
        print("i is not 1\n")
        return 1
    }
    if (j != 2) {
        print("j is not 2\n")
        return 2
    }
    if (k != 2) {
        print("k is not 2\n")
        return 3
    }
    return 0
}
