// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.o
// EXEC: %compiler %cmp_opt %f -import-config cfg-ast pkgs.o -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.test

class test {
    func foo(a: A): Int32 {
        return 1
    }
}

record A{}
append A with pkgs.test {
    func foo(a: A): Int32 {
        return 7
    }
}

func run(): Int64 {
    var res1: Int32 = foo(A())
    var res2: Int32 = test().foo(A())
    if (  res1 + res2 ==  8) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
