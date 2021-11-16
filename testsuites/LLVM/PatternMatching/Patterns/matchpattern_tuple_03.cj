// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main():Int64 {
    case60_5()
    return 0
}

func case60_5(){
    let a:Float32 = 90
    let b:Int32 = 90
    let scoreTuple = ("a",a)
    var result:String  = match (scoreTuple) {
        case ("a",$b) => "No"  // EXPECTED: regex error.*? const pattern is not matched
        case (_, _) => "None"
    }
}
