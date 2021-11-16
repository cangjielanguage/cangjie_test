// DEPENDENCE: Array_package02 import.conf
// EXEC: %compiler %cmp_opt -c Array_package02/Array_package02.cj -o Array_package02.%middle
// EXEC: %compiler %cmp_opt %f Array_package02.%middle -o %output
// EXEC: %run %run_opt %output %run_args
import Array_package02.*

func main(): Int64 {
   if(a[0]!=-1 || a1[0]!=1 || a2[0]!=1.0 || /* a3[0]!='a' || */ a4[0]!=true  /* || a5[0]!="aa" */){
        return 1
   }
   return 0
}
