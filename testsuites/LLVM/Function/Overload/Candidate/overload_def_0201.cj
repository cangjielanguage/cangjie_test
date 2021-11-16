// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

func foo1(x:Int64):Int64{ // EXPECTED: regex error.*?function 'foo1' has overload conflicts
    return Int64(1)
}
func foo1(x:Int64):Int32{ // EXPECTED: regex error.*?function 'foo1' has overload conflicts
    return Int32(2)
}

func foo2(x:Int64):Int32{ // EXPECTED: regex error.*?function 'foo2' has overload conflicts
    return 1
}
func foo2(x:Int64):Int32{ // EXPECTED: regex error.*?function 'foo2' has overload conflicts
    return 2
}

func foo3(x:Int64):Int32{ // EXPECTED: regex error.*?function 'foo3' has overload conflicts
    return 1
}
func foo3(x!:Int64):Int32{ // EXPECTED: regex error.*?function 'foo3' has overload conflicts
    return 2
}

func foo4(x!:Int64=2):Int32{ // EXPECTED: regex error.*?function 'foo4' has overload conflicts
    return 1
}
func foo4(y!:Int64=1):Int32{ // EXPECTED: regex error.*?function 'foo4' has overload conflicts
    return 2
}

func foo5(x:Int64):Int32{ // EXPECTED: regex error.*?function 'foo5' has overload conflicts
    return 1
}
func foo5(x!:Int64=1):Int32{ // EXPECTED: regex error.*?function 'foo5' has overload conflicts
    return 2
}
