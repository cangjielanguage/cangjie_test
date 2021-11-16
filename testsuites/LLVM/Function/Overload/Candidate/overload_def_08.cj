// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    if ( foo(1) != 1 ){
        return 1
    }
    return 0
}

func foo(x:Int32) {
   return x
}

let foo: (Int32)->Int32 = (x:Int32):Int32=>{ x*2 } // EXPECTED: regex error.*?redefinition of declaration 'foo'

