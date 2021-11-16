// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let b = RefArray<String>(["a", "b", "c"])
		b[0] = "d";
		b[1] = "d";
		b[2] = "d";

    if(b.get(0) != "d" || b.get(1) != "d" || b.get(2) != "d"){
      return 2
    }
    return 0
}
