// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
	var map: Map<Map<Int32, String> ,Map<Int32, Char>> = #{#{2:"a"}: #{3:'1'}}

	var key1 = #{1:2}
	var key2 = #{2:1}
	var map1 = #{key1:1,key2:2,#{1:2}:3} // key1的value被替换

	for ((key,value) in map) {
        for ((keyn,valuen) in key) {
            if (keyn != 2 || valuen != "a") {
                return 1
            }
	    }
	    for ((keym,valuem) in value) {
            if (keym != 3 || valuem != '1') {
                return 1
            }
	    }
	}
	var tmp = ""
	for ((key,value) in map1) {
        tmp = tmp + key.toString() + value.toString()
	}
	return 0
}