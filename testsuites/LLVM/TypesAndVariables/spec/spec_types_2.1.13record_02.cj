// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

/*
record R2 {// ok
    let other: Box<R2>
}
*/
record R5 { // ok
    let other: E1
}
enum E1 { // ok
    |A(R5)
}

func main(){
    return 0
}

