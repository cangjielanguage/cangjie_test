// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %f -import-config cfg-ast pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args


// 作用域
import pkgs.*

func main(): Int64{
    var a = A(2)
    a[2] = 4
    if (a[1] == 2 && a.b== 4) {
        return 0
    }
    return 1
}
