// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    let a = aoo( {x:Int32=> x*2 } )
    if ( a != 1 ){
        return 1
    }
    return 0
}

func aoo( foo:(Int32)->Int32 ) {
   func foo( x:Int32 ):Int32 { return x }
   return foo(1)
}
