// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit {
    Day | Month | Year
}
type Time = TimeUnit

func main(){
  //  var a = Time.Day
  //  var b = Time.Month  // Use type alias Time to access constructors in TimeUnit    
    return 0

}

