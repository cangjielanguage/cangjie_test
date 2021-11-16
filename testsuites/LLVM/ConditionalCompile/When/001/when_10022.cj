// EXEC: %compiler -config="(test=true)" %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface I{
    func test():Int64
}

@when[test=="true"]
class X <: I{
    func test(){0}
}


@when[test=="true"]
func main(){
    return X().test()
}