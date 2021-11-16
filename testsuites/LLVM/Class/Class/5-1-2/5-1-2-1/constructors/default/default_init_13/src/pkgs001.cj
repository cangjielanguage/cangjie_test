// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle && %copycharjs src/pkgs/
// EXEC: %compiler %cmp_opt %f   pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args 

import pkgs.*

class Data <: Base<Bool>{
    var a: Int64 = 5
}

func run(): Int64 {
    var value : Data = Data()
    return value.a - 5
}

func main(): Int64 {
    return run()
}
