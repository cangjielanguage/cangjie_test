// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Data{
     var score :String
     init(x:Int32){
         score = match (x) {
            case 60 => "PASS"
            case 90 => "excellent"
            case _=> "NA"
         }
     }
}

func main():Int64 {
    var data1 = Data(90)
    if (data1.score =="excellent") {
        return 0
    }
    return 1
}