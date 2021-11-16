// DEPENDENCE: ./a/a.cj  import.cfg
// EXEC: %compiler %cmp_opt -c a.cj -o a.o
// EXEC: %compiler %cmp_opt -import-config import.cfg %f a.o -o %output
// EXEC: %run %run_opt %output %run_args
import a.*
func g<T>() where T <: a.first {}

func main(){
    g<a.A>()
    return 0
}