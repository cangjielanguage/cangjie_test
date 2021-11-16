// EXEC: %compiler -config="(test=true)" %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@when[test=="true"]
external interface B<T>{}

@when[test=="true"]
external class A<T> <: B<T>{
    var x : T
    init(i:T){
        x = i
    }
}

@when[test=="true"]
func main(){
    A<Int64>(0).x
}

@when[test!="true"]
func main(){
    1
}