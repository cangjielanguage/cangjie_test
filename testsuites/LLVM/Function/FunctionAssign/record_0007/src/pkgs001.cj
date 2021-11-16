// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %f pkgs.%middle -o %output 2>&1 |compare %f

import pkgs.*

func main(): Int64 {
    let a = R().a //EXPECTED: regex can not access function 'a'
    return 0   
}
