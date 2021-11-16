// ERRCHECK: %compiler -config="(debug=1)" %cmp_opt %f -o %output
// ASSERT: scan user defined condition's key can not be the same with builtin condition


@when[debug=="1"]
func main(){
    0
}
