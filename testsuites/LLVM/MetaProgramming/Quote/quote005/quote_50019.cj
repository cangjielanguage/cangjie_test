// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

from ast import ast.*

func main(){
    Int64(quote(1)) // EXPECTED: regex-auto use no-numeric type expr for numeric type convert
    ord(quote(1)) // EXPECTED: regex no matching function declaration for function call
    chr(quote(1)) // EXPECTED: regex no matching function declaration for function call
    return 0
}
