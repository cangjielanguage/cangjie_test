// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle && %copycharjs src/pkgs/
// EXEC: %compiler %cmp_opt %f   pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.*

func main(): Int64 {
    let a : Data = Data(10)
    let b = Data(10, i1: 10)
    if(a.i == 10 && b.i ==10 && b.i1 == 10){
      return 0
    }
    return 2   
}
