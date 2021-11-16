// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( case01() != "yes" ) {
        return 1
    }
    if ( case02() != "yes" ) {
        return 1
    }
   return 0
}

func case01(){
    let a = [(Year(1.0),Month(1.0,1.0)), (Year(2.0),Month(2.0,2.0)),(Year(3.0),Month(3.0,3.0))]
    var r1: String = match (a) {
        case [] => "empty"
        case [(Year(a),_),...] => "yes"
        case [...] => "default case"
    }
    r1
}

func case02(){
    let a = [(Year(1.0),Month(1.0,1.0)), (Year(2.0),Month(2.0,2.0)),(Year(3.0),Month(3.0,3.0))]
    var r1: String = match (a) {
        case [] => "empty"
        case [(Year(a),_),(b,Month(x,y)),...,(_,_)] => "yes"
        case [...] => "default case"
    }
    r1
}

func case03(){
    let a = [(Year(Year(1.0)),Year(Month(1.0,1.0))), (Year(Year(2.0)),Year(Month(2.0,2.0))),(Year(Year(3.0)),Year(Month(3.0,3.0)))]
    let b: Float32 = 2.0
    var r1: String = match (a) {
        case [] => "empty"
        case [(Year(m),_),(n,Year(Month(x,$b))),...,(_,_)] => "yes"
        case [...] => "default case"
    }
    r1
}

enum TimeUnit {
    Year(Float32)
    | Month(Float32,Float32)
}
enum TimeUnit2 {
    Year(Float32*Float32)
}
enum TimeUnit3 {
    Year(TimeUnit)
}
