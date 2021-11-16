// EXEC: %compiler -config="(a=b,b=c,c=d,d=a)" %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@when[(a=="b")&&(b=="c")&&(c=="d")&&(d=="a")]
func main(){
    0
}