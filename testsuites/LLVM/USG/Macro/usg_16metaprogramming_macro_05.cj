// DEPENDENCE: pkg1.cj
// EXEC: %compiler %cmp_opt pkg1.cj -c -backend-options="-fPIC" -o pkg1.%middle
// EXEC: %compiler %cmp_opt %n.cj pkg1.%middle %use_ast -o %output
// EXEC: %run %run_opt %output

package p3

import macro pkg1.*

@Foo
record Data {
    let a = 2
    let b = @AddToMul(2+3)

    @Bar
    func getA() {
        return a
    }

    func getB() {
        return b
    }
}

func main(): Int64 {
    var data = Data()
    var a = data.getA()
    var b = data.getB()

    if (a == 2 && b == 8) {
        return 0
    }
    return 1
}