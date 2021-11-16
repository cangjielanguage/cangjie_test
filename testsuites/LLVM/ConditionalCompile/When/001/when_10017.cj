// EXEC: %compiler -config="(test=true)" %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@when[test=="true"]
external enum A<T>{
    i
    prop let a : Int64{
        get(){0}
    }
}

@when[test=="true"]
func main(){
    A<Int64>.i.a
}

@when[test!="true"]
func main(){
    1
}
