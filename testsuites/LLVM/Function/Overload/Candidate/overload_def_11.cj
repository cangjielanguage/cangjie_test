// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

func foo1(){}
func foo1()(){} // EXPECTED: regex function 'foo1' has overload conflicts

func foo2(a:Int32){}
func foo2(a:Int32)(b:Int32){} // EXPECTED: regex function 'foo2' has overload conflicts
