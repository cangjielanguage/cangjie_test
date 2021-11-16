// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

class Foo {
    prop let a: Int64 { // ok
       private get() { return 0 }  // EXPECTED: regex error.*?modifier is not allowed here
    }
    prop let b: Int64 { // ok
       protected get() { return 0 }  // EXPECTED: regex error.*?modifier is not allowed here
    }
    prop let c: Int64 { // ok
      public get() { return 0 }  // EXPECTED: regex error.*?modifier is not allowed here
    }

}
func main():Int64 {
    return 0
}
