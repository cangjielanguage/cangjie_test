// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan can not match-v1
// ASSERT: scan can not match-v2
// ASSERT: scan can not match-v3

from std import regex.*
func main()
{
   // \
   var result1=Regex("\\v").matches("\v").getOrThrow().matchStr()
   var result2=Regex("\\\v").matches("\v").getOrThrow().matchStr()
   var result3=Regex("\\\\v").matches("\\v").getOrThrow().matchStr()

   if(result1!="\v"||result2!="\v"||result3!="\\v")
   {
        print("Part1+${result1}+${result2}+${result3}")
        return 1
   }

   try{
       var resultv1=Regex("\\v").matches("\\v").getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("can not match-v1\n")
   }

   try{
       var resultv2=Regex("\\\v").matches("\\v").getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("can not match-v2\n")
   }

   try{
       var resultv3=Regex("\\\\v").matches("\v").getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("can not match-v3\n")
   }
   return 0
}