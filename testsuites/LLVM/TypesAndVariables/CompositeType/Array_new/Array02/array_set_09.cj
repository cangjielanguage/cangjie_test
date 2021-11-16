// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let b = Array<Int64>([1,2,3])
		b.set(0, 4);
		b.set(1, 4);
		b.set(2, 4);

    if(b[0] != 4 || b[1] != 4 || b[2] != 4){
      return 2
    }
    return 0
}
