// DEPENDENCE: ../src 
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle  && %copycharjs src/pkgs/
// EXEC: %compiler %cmp_opt %f   pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.one as o
import pkgs.two as t

func main(): Int64 {
    o = 3
    t = 3

    return Int64(o-t)
}
