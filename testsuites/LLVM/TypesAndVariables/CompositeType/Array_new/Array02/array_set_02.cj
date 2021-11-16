// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let b = Array<String>(["a", "b", "c"])
		b[0] = "d";
		b[1] = "d";
		b[2] = "d";

     let string1: String = match (b.get(0)) {
      case Some("d") => "d" 
      case $None => ""
    }

     let string2: String = match (b.get(1)) {
      case Some("d") => "d" 
      case $None => ""
    }

     let string3: String = match (b.get(2)) {
      case Some("d") => "d" 
      case $None => ""
    }

    if(string1 != "d" || string2 != "d" || string3 != "d"){
      return 2
    }
    return 0
}
