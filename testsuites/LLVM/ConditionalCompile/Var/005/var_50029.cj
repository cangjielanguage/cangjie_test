// EXEC: %compiler -config="(a=true,b=true)" %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

@when[a=="false" || b=="true"]
func main(){
    print("success")
    0
}

@when[a=="false" || b=="false"]
func main(){1}