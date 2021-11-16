// DEPENDENCE: refArray_new_09 import.conf
// EXEC: %compiler %cmp_opt -c refArray_new_09/refArray_new_09.cj -o refArray_new_09.%middle
// EXEC: %compiler %cmp_opt %f refArray_new_09.%middle  -o %output
// EXEC: %run %run_opt %output %run_args
import refArray_new_09.*
func main(): Int64 {
    if (a.size() == 1 && a[0] == 1 && a1.size() == 1 && a1[0] == 1 && a2.size() == 1 && a2[0] == 1 && a3.size() == 1 && a3[0] == 1 && a4.size() == 1 && a4[0] == 1 && a5.size() == 1 && a5[0] == 1 && a6.size() == 1 && a6[0] == 1&& a7.size() == 1 && a7[0] == 1&& a8.size() == 1 && a8[0] == 1.0&& a9.size() == 1 && a9[0] == 1.0&& a10.size() == 1 && a10[0] == 1.0&& a11.size() == 1 && a11[0] == 'a'&& a12.size() == 1 && a12[0] == true&& a13.size() == 1 && a13[0] == "false"){
      return 0;
    }
    return 2
}
