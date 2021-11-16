// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    return run()
}

func run(): Int64 {
    if ( Foo() == ()){
        return 0
    }
    return 1
}

var hundred = 0
func Foo( c!:Unit = while (hundred < 10) {
    hundred++;
    if(hundred<5){
        continue
    }
    //print(hundred.toString()) // 5678910
    }):Unit{
      return c
}
