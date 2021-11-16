// ERRCHECK: %compiler -config="(os=1)" %cmp_opt %f -o %output
// ASSERT: scan user defined condition's key can not be the same with builtin condition


@when[os=="linux"]
func main(){
    0
}

@when[os!="linux" && os!="1"]
func main(){
    0
}
