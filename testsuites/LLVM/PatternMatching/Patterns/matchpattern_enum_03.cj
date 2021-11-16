// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main():Int64 {
    if (case02() != 0) {return 1}
    return 0
}

enum TimeUnit {
    Year(Float32)
    | Month(Float32, Float32)
    | Day(Float32, Float32, Float32)
    | Hour(Float32, Float32, Float32, Float32)
    }
trait equal {
    operator func !=(input:This, input_b:This):Bool
}
append TimeUnit with equal{
    operator func !=(input:TimeUnit,input_b:TimeUnit):Bool{false}
}

let a = TimeUnit.Year(2.0)
func case02(){
    var result:String  = match (TimeUnit.Year(1.0)) {
        case $a  => "Yes" // EXPECTED: regex error.*?no overloaded '==' function in match case pattern
        case _ => "None"
    }
    if (result == "Yes") {return 0}
    return 1
}