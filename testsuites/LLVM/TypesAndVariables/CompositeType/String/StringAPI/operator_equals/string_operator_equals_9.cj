// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
var s1:String ="汉"
var s2:String ="\t"
var s3:String ="t"
var s4:String ="\u{2000}"
var s5:String =""

if(s1==s2||s1==s3||s1==s4||s1==s5||s2==s3||s2==s4||s2==s5||s3==s4||s4==s5){
return 1
}
return 0

}