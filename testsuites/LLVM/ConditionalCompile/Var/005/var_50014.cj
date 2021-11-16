// ERRCHECK: %compiler -config="(os=ios)" %cmp_opt %f -o %output
// ASSERT: scan user defined condition's key can not be the same with builtin condition


@when[os=="ios"]
func main(){
    0
}
