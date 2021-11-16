// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let b = Array<String>(3, {i => match(i){
        case 0 => "a"
        case _ => "c"
    }})

    let string1: String = match (b.get(0)) {
      case Some("a") => "a" 
      case $None => ""
    }

    let string2: String = match (b.get(1)) {
      case Some("c") => "c" 
      case $None => ""
    }

    let string3: String = match (b.get(2)) {
      case Some("c") => "c" 
      case $None => ""
    }

    if(string1 != "a" || string2 != "c" || string3 != "c" || b[0] != "a" || b[1] != "c" || b[2] != "c"){
      return 2
    }
    return 0
}
