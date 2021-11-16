// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %f -import-config cfg-ast pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args


// 作用域
import pkgs.*

func main(): Int64{
    var index: Int32  = 2
    var a = A(2)
    var b = B(2)
    a[b] = 4  // EXPECTED: regex ambiguous match for \[\] overload function call
    return 0
}
