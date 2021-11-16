// DEPENDENCE: ./a  import.cfg
// EXEC: %compiler %cmp_opt -c ./a/a.cj -o ./a/a.o
// EXEC: %compiler %cmp_opt -import-config import.cfg %f ./a/a.o -o %output
// EXEC: %run %run_opt %output %run_args

import a.*
class A{}
append A with first{}

interface g<T> where T <: a.first {}

func main(){
    var a : g<A>
    return 0
}
