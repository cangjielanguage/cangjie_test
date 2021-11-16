// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o a.%middle
// EXEC-PIPE-1: %compiler %cmp_opt a.%middle %f -o %output 2>&1 | compare %f
//// DEPENDENCE: p1
////EXEC: %compiler %cmp_opt  ./p1/*.cj -backend-options='-shared -fPIC' -o libp1.so
////EXEC-PIPE-1: %compiler %cmp_opt %f -backend-options='-L. -lp1' -o %output 2>&1 | compare %f

import p1.coo
import p1.B

func main(): Int64 {
    var r4 = coo<String>("a") // EXPECTED: regex error.*xxxx
    return 0
}