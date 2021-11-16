// DEPENDENCE: ./a.cj  import.cfg
// EXEC: %compiler -c %cmp_opt a.cj -o a.o
// EXEC: %compiler %cmp_opt %f a.o -import-config import.cfg -o %output
// EXEC: %run %run_opt %output %run_args

package b
import a.*

func main(){
    if A.test(input:1) != 2{
        return 1
    }
    if B.test(input:1) != 2{
        return 2
    }
    if C.test(input:1) != 2{
        return 3
    }
    if A.a != 1{
        return 4
    }
    if B.a != 1{
        return 5
    }
    if C.a != 1{
        return 6
    }
    return 0
}
