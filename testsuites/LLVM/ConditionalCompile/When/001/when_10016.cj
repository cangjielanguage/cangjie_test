// EXEC: %compiler -config="(test=true)" %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@when[test=="true"]
func test<T>(x:T){
    x
}

@when[test=="true"]
func main(){
    test<Int64>(0)
}

@when[test!="true"]
func main(){
    1
}