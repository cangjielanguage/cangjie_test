// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
var s1:String ="\0"
var s2:String ="\0"
var s3:String ="\t"
var s4:String ="\t"
var s5:String ="\n"
var s6:String ="\n"

if(s1==s2&&s3==s4&&s5==s6){
return 0
}




return 1
}