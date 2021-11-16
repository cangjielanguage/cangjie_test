// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="[0-9]"
   var matchString:Array<String>=Array<String>(["9a807$6中5^4*3&2@1!00","8a","70","6$","5中","4^","3*","2&","1@","0!","00"])
   var regex1=Regex(regexString)
   var regex2=Regex(regexString,2)
   for (i in matchString)
   {
      var expectresult=i.substring(0,1)
      var matchresult1=Matcher(regex1,i).matchStart().getOrThrow().matchStr()
      var matchresult2=Matcher(regex2,i).matchStart().getOrThrow().matchStr()
      var matchresult3=regex1.matcher(i).matchStart().getOrThrow().matchStr()
      var matchresult4=regex2.matcher(i).matchStart().getOrThrow().matchStr()
     if(matchresult1!=expectresult||matchresult2!=expectresult||matchresult3!=expectresult||matchresult4!=expectresult)
     {
         print("${matchresult1}+${matchresult2}+${matchresult3}+${matchresult4}\n")
         return 1
     }
   }
   print("success\n")
   return 0
}