// DEPENDENCE: ./a  import.cfg
// EXEC: %compiler %cmp_opt -c %backendjs ./a/a.cj -o a.%middle
// EXEC: %compiler %cmp_opt -c %backendjs  %f

import a.*
let classA : A = A()
interface C <: B{}
func main(){
    var d = foo()
    x = 2
    var e = x + y
}