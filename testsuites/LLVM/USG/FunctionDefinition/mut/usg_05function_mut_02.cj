// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output  2>&1| compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Foo {
    var i = 0
    func g() {
        i += 1 // EXPECTED:regex error.*?instance member variable 'i' cannot be modified in immutable function
    }
}

func main(){
    return 0
}
