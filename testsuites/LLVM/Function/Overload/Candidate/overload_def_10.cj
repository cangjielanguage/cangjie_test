// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {

    return 0
}

func foo(x:(Int32)->Int32) {
   return x
}
func foo0(x:(Int32)->Int32) {
   return x(1)
}

func foo3() {
   func foo0 ( x:Int32 ):Int32 { return x }
}
