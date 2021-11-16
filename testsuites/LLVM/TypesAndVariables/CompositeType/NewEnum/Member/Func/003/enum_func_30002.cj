// DEPENDENCE:  test.cj
// EXEC: %compiler test.cj -c -backend-options="-fPIC"
// EXEC: %compiler %f ./test.o %use_ast -o %output 2>&1 | compare %f

import test.*

enum A{
    a
    @M[1] // EXPECTED: regex-auto undeclared identifier 'M'
    func test(){}
}


func main(){
    A.a.test()
    return 0
}
