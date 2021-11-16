// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var map: Map<String,Int64> = # {"a":1,"b":2,"a":3}
    var value = map.get("a")
    match (value) {
        case None => 3
        case Some(v) => {
            if ( v !=3 ){
                return 1
            }
            else {
                return 2
            }
		}()
	}
	return 0
}
