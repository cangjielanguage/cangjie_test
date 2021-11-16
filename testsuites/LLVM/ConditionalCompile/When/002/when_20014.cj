// EXEC: %compiler -config="(test=true)" %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@when[test=="true"]
func main(){
    var when = 0
    return when
}
