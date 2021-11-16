// EXEC: %compiler -config="(test=true)" %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@when[test=="true"]
type X = Int64


@when[test=="true"]
func main(){
    var x : X = 0
    return x
}