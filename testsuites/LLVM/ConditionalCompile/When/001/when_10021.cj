// EXEC: %compiler -config="(test=true)" %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class X{}

@when[test=="true"]
extend X{
    func test(){0}
}


@when[test=="true"]
func main(){
    return X().test()
}