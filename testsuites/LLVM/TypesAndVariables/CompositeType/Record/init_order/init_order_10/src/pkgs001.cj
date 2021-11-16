// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %f   pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args 

import pkgs.*

func run(): Int64 {
    var value : Data<Int32> = Data<Int32>(5)
    if ((value.a == 5) && (value.b == 10.0)){
        return 0
    }
    else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
