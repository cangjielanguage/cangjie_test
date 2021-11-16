// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

class Foo {
    prop var a: Int64 { // ok
       public get() {  // EXPECTED: regex error.*?modifier is not allowed here
            return 0
        }
       public set(v){}  // EXPECTED: regex error.*?modifier is not allowed here
    }
}
func main():Int64 {
    return 0
}
