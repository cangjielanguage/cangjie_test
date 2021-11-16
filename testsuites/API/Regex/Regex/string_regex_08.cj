// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan regex pattern is too long
// ASSERT: scan regex1 pattern is too long
// ASSERT: scan no data
// ASSERT: scan no data2
// ASSERT: scan success

from std import regex.*
func main()
{
  var str=""
  for(i in 0..99999)
  {
        str=str+"a"
  }
   try{
      var regex1=Regex(str)// init(regex: String)
   }catch(e:RuntimeException){
      print("regex pattern is too long\n")
   }
   try{
      var regex2=Regex(str,2)//init(regex: String , flag: int64)
   }catch(e:RuntimeException){
      print("regex1 pattern is too long\n")
   }
   var regexstr:String="a"
   var regex3=Regex(regexstr)
   var regex4=Regex(regexstr,2)
   try{
      var matchesresult1=regex3.matches(str).getOrThrow().matchStr()  //matches (input: String): Option<MatchData>
   }catch(e:NoneValueException){
      print("no data\n")
   }
   try{
      var matchesresult3=regex4.matches(str).getOrThrow().matchStr()
   }catch(e:NoneValueException){
     print("no data2\n")
   }

   var matchesresult2=regex3.matcher(str).find().getOrThrow().matchStr()  //matcher(input: String): Matcher
   var matchesresult4=regex4.matcher(str).find().getOrThrow().matchStr()
  if(matchesresult2!=regexstr||matchesresult4!=regexstr)
  {
      print("${matchesresult2}+${matchesresult4}\n")
      return 1
  }
   print("success\n")
   return 0
}