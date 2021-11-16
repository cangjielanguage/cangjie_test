// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

let a1 = [50,70,90]
var r1 = match (a1) {
    case [] => 1
    case [a,70,90] => a-50
    case [...] => 3
}

let a2 = 1
let a0 = 90

var r5 = match (["hello","hello"]) {
    case ["world",_] => 3
    case ["""
hello
""",_] => 1
    case [#"hello
    "#,_] => 2
    case [#"hello"#,_] => 0
    case _ => 1
}

func main() : Int64 {
    if ( r1 != 0 ) {
        return 1
    }
    if ( r5 != 0 ) {
        return 5
    }
    return 0
}
