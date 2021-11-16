// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.o
// EXEC: %compiler %cmp_opt %f -import-config cfg-ast pkgs.o  -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.test
interface Foo {
    let test: Int32 = 3
}

func run(): Int64 {
    var foo = Foo.test
    if (foo == 3 && test ==4 ){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
