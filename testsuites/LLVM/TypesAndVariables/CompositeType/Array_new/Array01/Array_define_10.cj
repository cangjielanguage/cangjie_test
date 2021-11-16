// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a1 = Array<Char>(['a','b'])

func main(): Int64 {

    let score: Char = 'a'
    var scoreResult: Array<Char> = match (score) {
        case 'c' => Array<Char>(['c','d'])
        case 'g' | 'b' => Array<Char>(['c','d'])
        case 'a' => a1
        case _ => Array<Char>()
    }
    if(scoreResult[0]=='a' && scoreResult[1]=='b'){
        return 0
    }
    return 1

}
