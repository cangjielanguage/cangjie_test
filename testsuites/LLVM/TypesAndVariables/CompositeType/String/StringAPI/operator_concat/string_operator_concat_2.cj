// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
var s1:String ="Test String"
let s2:String ="\t"
var s3:String ="\n"
var s4:String ="\0"
if((s1+s2)!="Test String\t"){
return 1
}
if((s1+s3)!="Test String\n"){
return 1
}
if((s1+s4)!="Test String\0"){
return 1
}
return 0
}