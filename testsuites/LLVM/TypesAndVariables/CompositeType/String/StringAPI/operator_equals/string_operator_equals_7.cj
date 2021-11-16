// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
var s1:String ="STA"
var s2:String ="ST"

if(s1.substring(0,2)==s2){
return 0
}
return 1

}