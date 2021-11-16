// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var regexString="[0-9]"
   var matchString:Array<String>=Array<String>(["a9","#8","!7","%6","&5","*4","(3","~2","^1",")0"])
   var regex1=Regex(regexString)
   var regex2=Regex(regexString,2)
   var count=0
   for (i in matchString)
   {
      try
      {
           var matchresul1=Matcher(regex1,i).matchStart().getOrThrow().matchStr()
      }catch(e:NoneValueException){
        print("None\n")
        count+=1
     }

   }
   if(count!=10)
   {
       return 1
   }
   print("success\n")
   return 0
}