// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

record R{
	R(var ra!: Int64 = 0, let rb!: Int64 = 0){

	}
}

func main() {
    var arr : RefArray<R> = RefArray<R>([R(ra: 0, rb: 0)])
    var b = arr
    b[0].ra = 1 // EXPECTED: regex cannot change immutable value : function call returns immutable value
    b.get(0).ra = 1 // EXPECTED: regex cannot change immutable value : function call returns immutable value

    b[0].rb = 1 // EXPECTED: regex cannot assign to value : 'Record-R.rb' is an initialized 'let' constant

    return 0
}