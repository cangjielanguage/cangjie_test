// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output
// ASSERT: scan cannot convert an integer literal to type 'Enum-TokenKind'
import ast.*


func main(){
    var T : Tokens = Tokens(@{Token(-1)})
    if (T.Seeing(-1)) {
        return 1
    }
    return 0
}