// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main():Int64 {
    return 0
}

func case01(){
    let score = 80
    let a = 70
    var result: Int64 = match (score) {
        case a@ 80 | a@ 50 => 0  // EXPECTED: regex error.*?expected constant literal here
        case _ => 10
    }
    return result
}

func case02(){
    let score = 80
    let a = 70
    var result: Int64 = match (score) {
        case 1a@ 80 |  50 => 0  // EXPECTED: regex error.*?expected '=>' after pattern in case body
        case _ => 10
    }
    return result
}

func case03(){
    let score = 80
    let a = 70
    var result: Int64 = match ((0,1)) {
        case a@(a@ 0,1) => a[0]+1 // EXPECTED: regex error.*?redefinition of declaration 'a'
        case _ => 10
    }
    return result
}

func case04(){
    let score = 80
    let a = 70
    var result: Int64 = match ((0,1)) {
        case a@(b@ _, b@ 1 ) => a[0] + b -1 // EXPECTED: regex error.*?redefinition of declaration 'b'
        case _ => 10
    }
    return result
}

let b = (TimeUnit.Year(2),TimeUnit.Month(1,2))
let c  = b[0]
func case05(){
    var result:Int64  = match (b[0]) {
        case y@ Year(y) => 0 // EXPECTED: regex error.*?redefinition of declaration 'y'
        case _  => 10
    }
    return result
}

enum TimeUnit {
    Year(Float32)
    | Month(Float32, Float32)
    | Day(Float32, Float32, Float32)
    | Hour(Float32, Float32, Float32, Float32)
    }
trait equal {
    operator func ==(input:This, input_b:This):Bool
}
append TimeUnit with equal{
    operator func ==(input:TimeUnit,input_b:TimeUnit):Bool{true}
}

append ()->Int64 with equal{
    operator func ==(input:()->Int64,input_b:()->Int64):Bool{true}
}
