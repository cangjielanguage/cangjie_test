// DEPENDENCE: Array_package01 import.conf
// EXEC: %compiler %cmp_opt -c Array_package01/Array_package01.cj -o Array_package01.%middle
// EXEC: %compiler %cmp_opt %f Array_package01.%middle -o %output
// EXEC: %run %run_opt %output %run_args
import Array_package01.*

func main(): Int64 {
    return return a.size() + a1.size() + a2.size() + a3.size() + a4.size() + a5.size() + a6.size() + a7.size() + a8.size() + a9.size() + a10.size() + a11.size() + a12.size() + a13.size()
}
