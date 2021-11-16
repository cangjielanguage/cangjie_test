// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main():Int64 {
    case60()
    return 0
}

func case60(){
    let scoreTuple = ("a",90)
    var result:String  = match (scoreTuple) {
        case ("a",90) => "Yes"
        case ("a",(50,90)) => "No" // EXPECTED: regex error.*?tuple pattern is not matched
        case (_, _) => "None"
    }
}

func case60_2(){
    let scoreTuple = ("a",90)
    var result:String  = match (scoreTuple) {
        case ("a",90) => "Yes"
        case (50,90) => "No"  // EXPECTED: regex error.*?const pattern is not matched
        case (_, _) => "None"
    }
}

//spec: tuple pattern 中的子 pattern 个数需要和 selector 的维度相同
func case60_3(){
    let scoreTuple = ("a",90)
    var result:String  = match (scoreTuple) {
        case ("a",50,90) => "No"  // EXPECTED: regex error.*?tuple pattern with correct size expected
        case (_, _) => "None"
    }
}

func case60_4(){
    let scoreTuple = ("a",90)
    var result:String  = match (scoreTuple) {
        case (50,90) => "No"  // EXPECTED: regex error.*?const pattern is not matched
        case (_, _) => "None"
    }
}

func case60_5(){
    let a:Float32 = 90
    let b:Int32 = 0
    let scoreTuple = ("a",a)
    var result:String  = match (scoreTuple) {
        case ("a",$b) => "No"  // EXPECTED: regex error.*? const pattern is not matched
        case (_, _) => "None"
    }
}

func case60_6(){
    let a:Float32 = 90
    let scoreTuple = ("a",a)
    var result:String  = match (scoreTuple) {
        case ("a",Int32(5)) => "No"  // EXPECTED: regex expected pattern here
        case (_, _) => "None"
    }
}


//spec:每个 pattern 之间使用逗号分隔(pattern_1, pattern_2, … pattern_k)
func case60_11(){
    let scoreTuple = ("a",90)
    var result:String  = match (scoreTuple) {
        case ("a";90) => "Yes" // EXPECTED: regex error.*?tuple pattern with correct size expected
        case (_, _) => "None"
    }
}
func case60_12(){
    let scoreTuple = ("a",90)
    var result:String  = match (scoreTuple) {
        case ("a"|90) => "No" // EXPECTED: regex error.*?tuple pattern with correct size expected
        case (_, _) => "None"
    }
}
func case60_13(){
    let scoreTuple = ("a",90)
    var result:String  = match (scoreTuple) {
        case ("a" // EXPECTED: regex error.*?tuple pattern with correct size expected
        90) => "No"
        case (_, _) => "None"
    }
}
func case60_14(){
    let scoreTuple = ("a",90)
    var result:String  = match (scoreTuple) {
        case ("a", // EXPECTED: regex-not error
        90) => "No"
        case (_, _) => "None"
    }
}