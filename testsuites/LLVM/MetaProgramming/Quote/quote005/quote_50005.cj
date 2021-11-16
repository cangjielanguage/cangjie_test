// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

from ast import ast.*

func main(){
    quote(1)**quote(1) // EXPECTED: regex invalid binary operator '\*\*' on type 'Class-Tokens' and 'Class-Tokens'
    quote(1)+&quote(1) // EXPECTED: regex-auto not supported operator: '+&'
    quote(1)**&quote(1) // EXPECTED: regex-auto not supported operator: '**&'
    quote(1)-&quote(1) // EXPECTED: regex-auto not supported operator: '-&'
    return 0
}
