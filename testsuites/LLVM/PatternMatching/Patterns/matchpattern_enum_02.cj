// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main():Int64 {
    if case01() != 0 {return 1}
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


func case01(){
    var result:String  = match (TimeUnit.Year(1)) {
        case Year(y)  | Month(x,y)  => "Yes" // EXPECTED: regex error.*?different number of variables are introduced in enum pattern
        case Month(x,y) => "No"
        case _ => "None"
    }
    if result == "Yes" {return 0}
    return 1
}