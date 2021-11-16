// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-not Segementation

func main():Int64 {
    if ( case01() != "yes" ) {
        return 1
    }
    if ( case02() != "yes" ) {
        return 2
    }
    if ( case03() != "1st is 50,2nd is 70,3rd is 90" ) {
        return 3
    }
    return 0
}

func case01(){
    let a = [50,70,90]
    var r1: String = match (a) {
        case [] => "empty"
        case [....] => "yes" // EXPECTED: regex error.*?expected ']' in the end of sequence pattern
    }
    r1
}

func case02(){
    let a = [50,70,90]
    var r1: String = match (a) {
        case [_,_,_,] => "yes" // EXPECTED: regex error.*?expected pattern here
        case [...] => "default case"
    }
    r1
}

func case03(){
    let a = [50,70,90]
    var r1: String = match (a) {
        case [x,y,z,] => "1st is $x,2nd is $y,3rd is $z" // EXPECTED: regex error.*?expected pattern here
        case [...] => "default case"
    }
    r1
}
