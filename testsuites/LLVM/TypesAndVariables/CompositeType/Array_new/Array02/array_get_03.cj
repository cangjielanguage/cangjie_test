// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
  let a = Array<String>(3, {i => match(i){
      case 1 => "a"
      case _ => "c"
  }})
  
  var c = a.get(-1)

  let string1: String = match (c) {
    case Some("a") => "a" 
    case Some("c") => "c" 
    case $None => "nothing"
  }

  if(string1=="nothing"){
    return 0
  }else{
    return 1
  }
}
