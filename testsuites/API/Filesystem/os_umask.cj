// DEPENDENCE: caserunner.cj test_fj.txt test_fj_notnull.txt
// EXEC: %compiler %stdx_cmp_opt caserunner.cj -o %output %f
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError

from std import os.*
from ffi import c.*
func main() : Int64{
   if(umask(S_IRUSR) is Int32 )
   {
      return 1
   }
   if((umask(S_IWUSR) is Int32)&& umask(S_IWUSR)==256)
   {
      return 2
   }
   if((umask(S_IXUSR) is Int32)&& umask(S_IXUSR)==128)
   {
      return 3
   }
   if((umask(S_IRWXU) is Int32)&& umask(S_IRWXU)==64)
   {
      return 4
   }
   if((umask(S_IRGRP) is Int32)&& umask(S_IRGRP)==448)
   {
      return 5
   }
   if((umask(S_IWGRP) is Int32)&& umask(S_IWGRP)==32)
   {
      return 6
   }
   if((umask(S_IXGRP) is Int32)&& umask(S_IXGRP)==16)
   {
      return 7
   }
   if((umask(S_IRWXG) is Int32)&& umask(S_IRWXG)==8)
   {
      return 8
   }
   if((umask(S_IROTH) is Int32)&& umask(S_IROTH)==56)
   {
      return 9
   }
   if((umask(S_IWOTH) is Int32)&& umask(S_IWOTH)==4)
   {
      return 10
   }
   if((umask(S_IXOTH) is Int32)&& umask(S_IXOTH)==2)
   {
      return 11
   }
   if((umask(S_IRWXO) is Int32)&& umask(S_IRWXO)==1)
   {
      return 12
   }
   return 0
}
