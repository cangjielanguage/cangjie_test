// EXEC: %compiler -config="(a=1,b=2,c=3,d=4)" %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@when[(a=="1")||(b=="3")||(c=="4")||(d=="5")]
func main(){
    0
}