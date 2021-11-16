// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    if ( foo3() != 3) {
        return 3
    }
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
   let a = foo0 // EXPECTED: regex reference to overloaded function 'foo0' could not be resolved
   let b = foo(foo0)
   return a(1) + b(2)
}
