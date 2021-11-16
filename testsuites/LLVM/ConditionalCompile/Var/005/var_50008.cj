// EXEC: %compiler -config="(a=1)" %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


var a = 2

@when[a=="1"]
func main(){
    print("a = 1\n")
    0
}
