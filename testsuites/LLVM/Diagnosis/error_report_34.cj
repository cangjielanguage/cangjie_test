// EXEC-PIPE-1:%compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

class A {}
func foo(x:A){}
func bar(x!: A = 10){}  // EXPECTED: regex cannot convert an integer literal to type 'Class-A'

func main() {
    foo(1)      // EXPECTED: regex cannot convert an integer literal to type 'Class-A'
    return 0
}
