// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

from ast import ast.*

extend Tokens <: ToString { // EXPECTED: regex imported type 'Tokens' cannot extend import interface
    func toString(): String {
        return match (this[0]) {
            case Some(t) => t.value
            case _ => "None"
        }
    }
}


func main(){
    var a : String = """
    ${quote(1)}"""
    print("result is " + a)
    return 0
}
