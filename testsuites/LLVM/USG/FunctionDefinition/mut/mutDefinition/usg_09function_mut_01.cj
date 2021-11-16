// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args

// check mut function defition in record
record A {
    mut func f(){return 0}
}

func main(){
    var a = A()
    let x = a.f()
    return x
}