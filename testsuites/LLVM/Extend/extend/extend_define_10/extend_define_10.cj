// DEPENDENCE:  pkg cfg-ast
// EXEC: %compiler %cmp_opt -c pkg/foo.cj -o pkg.%middle
// EXEC: %compiler %cmp_opt %n.cj pkg.%middle  -o %n.%middle 2>&1 | compare %f
// ASSERT: regex 'foo' is not accessible in package 'pkg'
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

import pkg.foo

extend foo {
    func compare(b: foo): foo {
        if(this.num > b.num){
            return this
        }
        return b
    }
}

func run(): Int64 {
    var a = foo(2)
    var b = foo(3)
    let x = compare(a , b)
    if (x.num == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
