// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

var r1 = match ((1,2)) {
    case (a@b,c@d)=> d-a -1
    case _ => 1
}

var r2 = match ((1,2)) {
    case (a@_,b@_)=> b-a-1
    case _ => 1
}

let a2 = 2
let a1 = 1
let a0 = 0
var r3 = match ((1,2)) {
    case (a@2,b@1) => 3
    case (a@1 | 2 ,b@2) if(false) => 7
    case (a@$a2,b@$a0) => 2
    case (a@$a1, b@$a2)=> b-a-1
    case _ => 1
}

var r4 = match (("hello","world")) {
    case (a@"world",b@"hello") => 3
    case (a@"hello",b@"world") => 0
    case _ => 1
}

var r5 = match (("hello","world")) {
    case (a@"world",b@"""
hello
""" )=> 1
    case (a@#"hello
    "# ,b@#"world"#)=> 2
    case (a@#"hello"#,b@#"world"#) => 0
    case _ => 1
}

func main() : Int64 {
    if ( r1 != 0 ) {
        return 1
    }
    if ( r2 != 0 ) {
        return 2
    }
    if ( r3 != 0 ) {
        return 3
    }
    if ( r4 != 0 ) {
        return 4
    }
    if ( r5 != 0 ) {
        return 5
    }
    return 0
}
