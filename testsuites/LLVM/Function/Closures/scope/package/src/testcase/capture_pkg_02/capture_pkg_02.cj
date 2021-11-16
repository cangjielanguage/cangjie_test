// DEPENDENCE: ../capture_pkg_02
// EXEC: %compiler %cmp_opt %pkg_opt %n -o ./
// EXEC: %run %run_opt %main %run_args

package testcase.capture_pkg_02

func main():Int64 {
    if (foo1() != 1){
        return 1
    }
    var m = foo1
    if (m(a) != 1){
        return 1
    }
    if (foo2() != 2){
        return 1
    }
    var n = foo2
    if (n(b) != 2){
        return 1
    }
    if (goo1() != 1){
        return 1
    }
    var k = goo1
    if (k() != 1){
        return 1
    }
    if (goo2() != 2){
        return 1
    }
    var l = goo2
    if (l() != 2){
        return 1
    }
    return 0
}


func foo1(x!:Int32 = a){return x}
func foo2(x!:Int32 = b){return x}
func goo1(){return a}
func goo2(){return b}
