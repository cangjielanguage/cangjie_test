// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

package pkgs

func main():Int64 {
    var a = A()
    if ( a.goo() != 10 ){
        return 1
    }
    return 0
}

func foo(a: Int64, fn: (Int64)->Int64) {
    return  fn(a)
}

class A {
    var a:Int32 = 1
    func foo(a: Int64, fn: (Int64)->Int64) {
        return  fn(a) + 1
    }
    func goo(){
        return pkgs.foo(1,{x:Int64 => x+ 1}) + foo(1,{x:Int64 => x+ 1}) + pkgs.foo(1){x:Int64 => x+ 1} + foo(1){x:Int64 => x+ 1}
    }
}

