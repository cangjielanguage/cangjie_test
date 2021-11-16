// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle && %copycharjs src/pkgs/
// EXEC: %compiler %cmp_opt %f  pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.test
class Foo {
    var test: Int32 = 3
}

func run(): Int64 {
    var foo = Foo().test
    if (foo == 3 && test ==4){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
