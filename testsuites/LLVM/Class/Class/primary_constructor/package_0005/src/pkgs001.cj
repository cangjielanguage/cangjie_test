// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %f   pkgs.%middle -o %output 2>&1 | compare %f

import pkgs.*


func main(): Int64 {
    let a : Data = Data(i1: 10) // EXPECTED: regex no matching constructor for call 'Data'
    let b = Data(11, I: 12) // EXPECTED: regex unknown named argument prefix 'I:'
    let c = Data(i1: 12, 9) // EXPECTED: regex positional argument cannot appeared after named argument

    if(a.i == 10 && b.i ==11 && b.i1 == 12 ){
      return 0
    }
    return 2   
}
