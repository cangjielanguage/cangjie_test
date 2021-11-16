// DEPENDENCE: ../../module_name
// EXEC: %compiler %cmp_opt -c ./module_name/src/package1/*.cj -o module_name/package1.%middle  && %copycharjs module_name
// EXEC: %compiler %cmp_opt module_name/package1.%middle  %f -o %output
// EXEC: %run %run_opt %output %run_args

from module_name import package1.*

func main(): Int64 {

    return 0
}