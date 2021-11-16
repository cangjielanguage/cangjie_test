// DEPENDENCE: array_new09 import.conf
// EXEC: %compiler %cmp_opt -c array_new09/array_new09.cj -o array_new09.%middle
// EXEC: %compiler %cmp_opt %f array_new09.%middle  -o %output
// EXEC: %run %run_opt %output %run_args
import array_new09.*

func main(): Int64 {
    return a.size() + a1.size() + a2.size() + a3.size() + a4.size() + a5.size() + a6.size() + a7.size() + a8.size() + a9.size() + a10.size() + a12.size() + a13.size()  + a11.size() - 14
}
