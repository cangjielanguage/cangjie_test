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
    if ( case03() != "yes" ) {
        return 3
    }
    return 0
}

func case01(){
    let a = [10,30,50,70,90]
    var r1: String = match (a) {
        case [] => "empty"
        case [10,...,30,50,70,...] => "yes" // EXPECTED: regex error.*?more than one '...' in sequence pattern
        case [...] => "default case"
    }
    r1
}

func case02(){
    let a = [10,30,50,70,90]
    var r1: String = match (a) {
        case [] => "empty"
        case [...,...] => "yes" // EXPECTED: regex error.*?more than one '...' in sequence pattern
        case [...] => "default case"
    }
    r1
}

func case03(){
    let a = [10,30,50,70,90]
    var r1: String = match (a) {
        case [] => "empty"
        case [10,...
            ,30,50,70,...] => "yes" // EXPECTED: regex error.*?more than one '...' in sequence pattern
        case [...] => "default case"
    }
    r1
}