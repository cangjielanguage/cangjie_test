// EXEC: %compiler %stdx_cmp_opt   %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

from std import regex.*
func main()
{
   var str="re\nre"

   var regex1=Regex(str)// init(regex: String)
   var regex2=Regex(str,2)//init(regex: String , flag: int64)
   var matchesresult1=regex1.matches(str).getOrThrow().matchStr()  //matches (input: String): Option<MatchData>
   var matchesresult3=regex2.matches(str).getOrThrow().matchStr()

   var matchesresult2=regex1.matcher(str).fullMatch().getOrThrow().matchStr()  //matcher(input: String): Matcher
   var matchesresult4=regex2.matcher(str).fullMatch().getOrThrow().matchStr()
  if(matchesresult1!=str||matchesresult2!=str||matchesresult3!=str||matchesresult4!=str)
  {
      print("${matchesresult1}+${matchesresult2}+${matchesresult3}+${matchesresult4}\n")
      return 1
  }
   print("success\n")
   return 0
}