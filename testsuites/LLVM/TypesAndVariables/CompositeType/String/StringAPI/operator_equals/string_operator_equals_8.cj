// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
var s1:String ="STA"
var s2:String ="ST"
var s3:String ="st"

if(s1==s2||s2==s3||s1==s3){
return 1
}
return 0

}