// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res = Goo()
    if( res == 1) {
        return 0
    }
    return 1
}

enum  Day{
    Monday | Tuesday
}

func Goo(a!:Day=Monday){
    var res : Int64 = match (a) {
        case $Monday => 1
        case $Tuesday => 2
    }
  return res
}


