// DEPENDENCE: ../module_name
// EXEC: %compiler %cmp_opt -c ./module_name/src/package1/*.cj -o module_name/package1.%middle  && %copycharjs module_name
// EXEC: %compiler %cmp_opt -c ./module_name/src/package2/*.cj -o module_name/package2.%middle  && %copycharjs module_name
// EXEC: %compiler %cmp_opt module_name/package1.%middle module_name/package2.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

from module_name import package1.*
from module_name import package1.*, package2.*
from module_name import package1.a1
from module_name import package1.a1, package2.a2
func main(): Int64 {
    var a = package1.a1
    var b = package2.a2
    var c = a1
    var d = a2
    return 0
}