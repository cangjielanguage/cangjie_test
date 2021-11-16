// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.o
// EXEC: %compiler %cmp_opt %f -import-config cfg-ast pkgs.o -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.test

trait test {
    func foo(a:This):This
}

append Int32 with test{
    func foo(a:Int32):Int32{
        return 2*a
    }
}

func run(): Int64 {
    var res1: Int32 = pkgs.test().foo(2)
    var res2 = foo(3)
    if (  res1 + res2 ==  8) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
