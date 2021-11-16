// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64{ 
     let a: Array<Int32> =  Array<Int32>([0, 70, 90]) // sorted array
     var r1: String = match (a) {
         case [] => "empty score array"
         case [50, ...] => "the lowest score is 50" // matched
         case [..., 90] => "the highest score is 90"
         case [low, ..., high] => "the lowest score is ${low}, the highest score is ${high}"
         case [...] => "default case"
     }
     let b: List<Int32> = [60, 80, 100] // sorted list
     var r2: String = match (b) {
         case [] => "empty score list"
         case [0, ...] => "the lowest score is 0"
         case [..., 99] => "the highest score is 99"
         case [low, ..., high] => "the lowest score is ${low}, the highest score is ${high}"  // matched
         case [...] => "default case"
     }
     let c: List<Int32> = [40, 60, 80, 100] // sorted list
     var r3: String = match (c) {
         case [] => "empty score list"
         case [a1, a2, a3, ..., b1, b2, b3] => "the highest three scores are ${b3}, ${b2} and ${b1}, and the lowest three scores are ${a1}, ${a2} and ${a3}"  // matched
         case [...] => "default case"
     }
     
//    print("${scoreResult}")
    return 0
}

