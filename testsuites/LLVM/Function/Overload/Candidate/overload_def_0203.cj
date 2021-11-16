// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    foo1(x:1,y:1) // EXPECTED: regex error.*?ambiguous match for function call 'foo1'
    foo1(x:Int32(1),y:Int64(1)) // EXPECTED: regex error.*?ambiguous match for function call 'foo1'
    foo2() // EXPECTED: regex error.*?ambiguous match for function call 'foo2'
    foo3(x:1,y:1) // EXPECTED: regex error.*?ambiguous match for function call 'foo3'
    foo3(x:Int32(1),y:Int64(1)) // EXPECTED: regex error.*?ambiguous match for function call 'foo3'
    foo3() // EXPECTED: regex error.*?ambiguous match for function call 'foo3'
    foo4(1,1) // EXPECTED: regex error.*?ambiguous match for function call 'foo4'
    return 0
}

func foo1(y!:Int64,x!:Int32):Int32{ // EXPECTED: regex-not error
    return 1
}
func foo1(x!:Int32,y!:Int64):Int32{ // EXPECTED: regex-not error
    return 2
}

func foo3(y!:Int64=1,x!:Int32=1):Int32{ // EXPECTED: regex-not error
    return 1
}
func foo3(x!:Int32=1,y!:Int64=1):Int32{ // EXPECTED: regex-not error
    return 2
}

func foo2(x!:Int64=1):Int32{
    return 1
}
func foo2(x!:Int32=1):Int32{
    return 2
}

func foo4(x:Int32,y:Int64):Int32{
    return 1
}
func foo4(x:Int64,y:Int32):Int64{
    return 2
}


