// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
var s1:String ="st"
var s2:String ="st"
let s3:String =s2
let s4:String =s1
if(s1==s3&&s1==s4){
return 0
}




return 1
}