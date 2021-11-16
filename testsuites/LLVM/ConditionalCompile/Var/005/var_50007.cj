// ERRCHECK: %compiler -config="(a=1,a=2)" %cmp_opt %f -o %output
// ASSERT:scan error: user defined condition's key can not repeat

@when[a=="1"]
func main(){
    print("a = 1\n")
    0
}

@when[a=="2"]
func main(){
    print("a = 2\n")
    0
}

