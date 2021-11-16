// DEPENDENCE: ../module_name
// EXEC: %compiler %cmp_opt -c ./module_name/src/package1/*.cj -o module_name/package1.%middle  && %copycharjs module_name
// EXEC: %compiler %cmp_opt -c ./module_name/src/package2/*.cj -o module_name/package2.%middle  && %copycharjs module_name
// EXEC: %compiler %cmp_opt module_name/package1.%middle module_name/package2.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

from module_name import package1.* as alias3.*

func main(): Int64 {

    return alias3.a1-1
}