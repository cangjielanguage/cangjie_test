// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
var s:String ="Test String"
let test:String ="Test String"
if(s.charAt(0)!='T'){
return 1
}
if(s.charAt(5)!='S'){
return 1
}
if(s.charAt(10)!='g'){
return 1
}
if(test.charAt(0)!='T'){
return 1
}
return 0
}