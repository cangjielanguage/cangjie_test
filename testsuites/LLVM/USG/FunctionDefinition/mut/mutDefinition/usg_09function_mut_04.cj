// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args

record A {
    mut func f(): Unit {}
}


extend A {
    mut func h(): Unit {}
}

func main(){
    var a = A()
    a.h()
    return 0
}