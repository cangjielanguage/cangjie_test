// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( goo(foo2(1){x:Int64 => x+ 1}) != 2 ){
        return 1
    }
    if ( goo(foo1{x:Int64 => x+ 1}) != 3 ){
        return 1
    }
    return 0
}

func goo(x:Int64){
    return x
}

func foo2(a: Int64, fn: (Int64)->Int64) {
    return  fn(a)
}

func foo1(fn: (Int64)->Int64) {
    return  fn(1) + 1
}

