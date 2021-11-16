// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.o
// EXEC: %compiler %cmp_opt %f -import-config cfg-ast pkgs.o -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.Num

record A {}
append A with Num {
    func plus(a: A, b: A): Int32 { 3 }
}

func main(): Int64 {
    let sum = plus(A(), A())
      if (sum != 3) {
            return 1
      }
      return 0
}
