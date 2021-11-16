// DEPENDENCE: ./a  import.cfg
// EXEC: %compiler %cmp_opt -c %backendjs ./a/a.cj -o a.%middle
// EXEC: %compiler %cmp_opt -c %backendjs  %f

import a.*

func main(){
    c = 2
    x = 2
    var e = c + b + x + y
}