// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle && %copycharjs src/pkgs/
// EXEC: %compiler %cmp_opt %f   pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.*

func main(): Int64 {
    let a : Data = Data(false)
    let b = Data(true)
    if(a.i){
      return 1
    } else{
      if(b.i){
        return 0  
      }
    }
    return 2   
}
