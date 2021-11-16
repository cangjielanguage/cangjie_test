// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    if ( foo(1) != 2) { // EXPECTED: regex error.*?ambiguous match for function call 'foo'
        return 1
    }
    if ( foo1(1,y:1) != 2) { // EXPECTED: regex error.*?ambiguous match for function call 'foo1'
        return 1
    }
    return 0
}

func foo(x:Int32){
    func foo(x:Int32){return x+3}
    return foo(x)+1
}
func foo(x:Int32,y!:Int32=1){
    return x + y
}

func foo1(x:Int32,y!:Int32=1){
    return x + y
}
func foo1(x:Int32,y!:Int32=1,z!:Int32=1){
    return x + y + z
}
