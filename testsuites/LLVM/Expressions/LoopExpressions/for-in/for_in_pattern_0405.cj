// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( case01() != 2.0 ) {
        return 1
    }
    if ( case02() != 10.0 ) {
        return 2
    }
    if ( case04() != 6.0 ) {
        return 4
    }
    if ( case05() != 3.0 ) {
        return 5
    }
    return 0
}

func case01(){
    let intList: List<TimeUnit> = [Year(1.0), Year(2.0)]
    var a: Float32 = 0.0
    for (Year(x) in intList) { // enum pattern contain variable pattern
        a = x
    }
    a
}

func case02(){
    let intList: List<TimeUnit> = [Year(1.0), Year(2.0)]
    var a: Float32 = 0.0
    for (Year(_) // enum patter contain wildcard pattern
     in intList) {
        a = a + 5.0
    }
    a
}

func case04(){
    let intList: List<TimeUnit2> = [Year((1.0,1.0)), Year((2.0,2.0))]
    var a: Float32 = 0.0
    for (Year((x,y)) // enum patter contain value-binding pattern,contain variable pattern
     in intList) {
        a = a + x + y
    }
    a
}

func case05(){
    let intList: List<TimeUnit3> = [Year(Year(1.0)), Year(Year(2.0))]
    var a: Float32 = 0.0
    for (Year(Year(x)) // enum patter contain irrefutable enum pattern
     in intList) {
        a = a + x
    }
    a
}

enum TimeUnit {
    Year(Float32)
}
enum TimeUnit2 {
    Year(Float32*Float32)
}
enum TimeUnit3 {
    Year(TimeUnit)
}
