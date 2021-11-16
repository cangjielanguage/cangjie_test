// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt %pkg_opt -c src/pkga/ -o ./
// EXEC: %compiler %cmp_opt %n.cj   pkga.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.*

func run(): Int64 {
    let v0: Int64 = 1
    let x: Int64 = Data(v0,v0) // call Common Func
   if (x != 1){
       return 1
   }
    return 0
}

func main(): Int64 {
    return run()
}
