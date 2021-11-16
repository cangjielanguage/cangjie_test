// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func test(x: Int32):String{
    var grade: String
    if (x > 60) {
        grade = "good"
    } else {
        grade = "bad"
    }
    return grade
}

func main(): Int64 {
    var i: Int32 = 90
    var result = match (i) {
        case grade => test(grade)
    }
    if (result == "good") {
        return 0
    }
    return 1
}

