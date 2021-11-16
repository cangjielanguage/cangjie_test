// ERRCHECK: %compiler -config="(backend=ark)" %cmp_opt %f -o %output
// ASSERT:scan user defined condition's key can not be the same with builtin condition


@when[backend=="ark"]
func main(){
    0
}
