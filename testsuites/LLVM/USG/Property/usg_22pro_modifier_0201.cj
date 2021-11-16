// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

class Foo {
    private prop let a: Int64 {
        get() { return 0 }
    }
}

func main() {
    var ret = Foo()
    if ( ret.a != 0 ) { //EXPECTED: regex error.*can not access field 'a'
        return 1
    }
    return 0
}
