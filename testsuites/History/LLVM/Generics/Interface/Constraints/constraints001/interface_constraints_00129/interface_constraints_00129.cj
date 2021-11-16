// DEPENDENCE: ./a  import.cfg
// EXEC: %compiler %cmp_opt -c ./a/a.cj -o ./a/a.o
// EXEC: %compiler %cmp_opt -import-config import.cfg %f ./a/a.o -o %output
// EXEC: %run %run_opt %output %run_args

import a.*

interface I<X>
where X<:a.A{} // EXPECTED: regex xxx
func main(){return 0}