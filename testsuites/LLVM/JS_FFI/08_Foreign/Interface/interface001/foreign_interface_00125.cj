// DEPENDENCE: ./a  import.cfg
// EXEC: %compiler %cmp_opt -c %backendjs ./a/a.cj -o a.%middle
// EXEC: %compiler %cmp_opt -c %backendjs  %f

import a.*

class C <: B{}

var i = C()
