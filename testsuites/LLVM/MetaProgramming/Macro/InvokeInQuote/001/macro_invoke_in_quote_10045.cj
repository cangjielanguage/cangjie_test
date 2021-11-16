// DEPENDENCE: define_10045.cj

// EXEC: %compiler %cmp_opt define_10045.cj -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt %f ./define_10045.o %use_ast -o %output
// EXEC: %run %run_opt %output

package use

import ast.*
import define_10045.*


func main(){
    var a = @Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y@Y
    func test() {}
    return a - 2
}
