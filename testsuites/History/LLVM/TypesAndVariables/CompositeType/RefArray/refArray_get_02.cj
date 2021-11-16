// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let b = RefArray<String>(3, {i => match(i){
        case 0 => "a"
        case _ => "c"
    }})

    if(b.get(0) != "a" || b.get(1) != "c" || b.get(2) != "c" || b[0] != "a" || b[1] != "c" || b[2] != "c"){
      return 2
    }
    return 0
}
