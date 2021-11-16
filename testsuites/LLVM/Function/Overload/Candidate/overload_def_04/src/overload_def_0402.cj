// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt src/a.cj src/%f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    let a = foo(1)
    if ( a != 1 ){
        return 1
    }
    return 0
}

func foo(x:Int32){
    return 2
}
