// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %f   pkgs.%middle -o %output 2>&1 | compare %f

import pkgs.*

func main(): Int64 {
    let a : Data = Data(10)
    let b = Data(11, i: 12) // EXPECTED: regex invalid named arguments prefix 'i:', target is not a named parameter

    if(a.i == 10 && b.i ==11 && b.i1 == 12 ){
      return 0
    }
    return 2   
}
