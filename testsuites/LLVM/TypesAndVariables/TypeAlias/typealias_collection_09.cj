// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type int = Array<Int64>
type str = Array<String>

func main(): Int64 {
    var opt1: Option<int> = Option<int>.Some([1, -1].toArray())
    var opt2: Option<Option<int>> = Option<Option<int>>.Some(opt1)
    var opt3: Option<str> = Option<str>.Some(["hello", "world"].toArray())
    var res1: int = match (opt2) {
        case Some(x) => match (x) {
                case Some(x) => x
                case $None => [1, 1].toArray()
            }
        case $None => [1, 1].toArray()
    }
    var res2: str = match (opt3) {
        case Some(x) => x
        case $None => ["hello", "Char"].toArray()
    }
    if (res1[0] + res1[1] == 0 && res2[0] + res2[1] == "helloworld") {
        return 0
    }
    return 1
}
