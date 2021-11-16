// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan can not match-f1
// ASSERT: scan can not match-f2
// ASSERT: scan can not match-f3

from std import regex.*
func main()
{
   // \
   var result1=Regex("\\f").matches("\f").getOrThrow().matchStr()
   var result2=Regex("\\\f").matches("\f").getOrThrow().matchStr()
   var result3=Regex("\\\\f").matches("\\f").getOrThrow().matchStr()

   if(result1!="\f"||result2!="\f"||result3!="\\f")
   {
        print("Part1+${result1}+${result2}+${result3}")
        return 1
   }

   try{
       var resultf1=Regex("\\f").matches("\\f").getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("can not match-f1\n")
   }

   try{
       var resultf2=Regex("\\\f").matches("\\f").getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("can not match-f2\n")
   }

   try{
       var resultf3=Regex("\\\\f").matches("\f").getOrThrow().matchStr()
   }catch(e:NoneValueException)
   {
       print("can not match-f3\n")
   }
   return 0
}