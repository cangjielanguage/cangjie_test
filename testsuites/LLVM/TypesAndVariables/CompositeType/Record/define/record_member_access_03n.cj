// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT:regex-not core dump
// ASSERT:regex-not stack trace

record GenRec{
    let b: Int32 = 1
    static func foo(): Int32 {
        return b        //EXPECTED: regex 'b' is non-static member, cannot be accessed by static function 'foo'
    }
}

func main():Int64 {
    var res = GenRec()
    if (res == 1) {
        return 0
    }
    return 1
}