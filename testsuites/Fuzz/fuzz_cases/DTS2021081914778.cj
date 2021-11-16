// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

enum TimeUnit {
    Year(Float32)
    | Month(Float32, Float32)
    | Day(Float32, Float32, Float32)
    | Hour(Float32, Float32, Float32, Float32)
}

var r1 = match (Year(1.0)) {
    case Year(a)=> a-1.0
    case _ => 1
}

var r2 = args

enum TimeUnit {
    Year(Float32)
    | Month(Float32, Float32)
    | Day(Float32, Float32, Float32)
    | Hour(Float32, Float32, Float32, Float32)
}

var r1 = match (Year(1.0)) {
    case Year(a)=> a-1.0
    case _ => 1
}

var r2 = match (Year(1.0)) {
    case Year(_)=> 0
    case _ => 1
}

let a2:Float32 = 1.0
let a0:Float32 = 0.0
var r3 = match (Year(1.0)) {
    case Year(2.0) => 3
    case Year(1.0) | Year(2.0) if(false) => 7
    camatch (Year(1.0)) {
    case Year(_)=> 0
    case _ => 1
}

let a2:Float32 = 1.0
let a0:Float32 = 0.0
var r3 = match (Year(1.0)) {
    case Year(2.0) => 3
    case Year(1.0) | Year(2.0) if(false) => 7
    case Year(1.0) | Year(2.0) if(true) => 0
    case _ => 1
}



func main() : Int64 {
    if ( r1 != 0.0 ) {
        return 1
    }
    if ( r2 != 0 ) {
        return 2
    }
    if ( r3 != 0 ) {
        return 3
    }
    return 0
}