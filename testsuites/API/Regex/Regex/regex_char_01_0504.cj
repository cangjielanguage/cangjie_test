// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan can not match-n1
// ASSERT: scan can not match-n2
// ASSERT: scan can not match-n3

from std import regex.*
func main()
{
   // \
   var result1=Regex("\\n").matches("\n").getOrThrow().matchStr()
   var result2=Regex("\\\n").matches("\n").getOrThrow().matchStr()
   var result3=Regex("\\\\n").matches("\\n").getOrThrow().matchStr()

   if(result1!="\n"||result2!="\n"||result3!="\\n")
   {
        print("Part1+${result1}+${result2}+${result3}")
        return 1
   }

   try{
       var resultn1=Regex("\\n").matches("\\n").getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("can not match-n1\n")
   }

   try{
       var resultn2=Regex("\\\n").matches("\\n").getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("can not match-n2\n")
   }

   try{
       var resultn3=Regex("\\\\n").matches("\n").getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("can not match-n3\n")
   }
   return 0
}