// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package fasta

var last : UInt32 = 42
let A : UInt32 = 3877
let C : UInt32 = 29573
let M : UInt32 = 139968

func rand():Float64{
	last = (last * A + C) % M
	return Float64(last) / Float64(M)
}

var ALU = "GGCCGGGCGCGGTGGCTCACGCCTGTAATCCCAGCACTTTGG" +
"GAGGCCGAGGCGGGCGGATCACCTGAGGTCAGGAGTTCGAGA" +
"CCAGCCTGGCCAACATGGTGAAACCCCGTCTCTACTAAAAAT" +
"ACAAAAATTAGCCGGGCGTGGTGGCGCGCGCCTGTAATCCCA" +
"GCTACTCGGGAGGCTGAGGCAGGAGAATCGCTTGAACCCGGG" +
"AGGCGGAGGTTGCAGTGAGCCGAGATCGCGCCACTGCACTCC" +
"AGCCTGGGCGACAGAGCGAGACTCCGTCTCAAAAA";

var IUB_keys : Array<String> = Array<String>([
    "a","c","g","t",
    "B","D","H","K",
    "M","N","R","S",
    "V","W","Y"
])

var IUB_values : Array<Float64> = Array<Float64>([
    0.27,0.12,0.12,0.27,
    0.02,0.02,0.02,0.02,
    0.02,0.02,0.02,0.02,
    0.02,0.02,0.02
])

var HomoSap_keys : Array<String> = Array<String>([
    "a","c","g","t"
])

var HomoSap_values : Array<Float64> = Array<Float64>([
    0.3029549426680,
    0.1979883004921,
    0.1975473066391,
    0.3015094502008
])

func makeCumulative(keys : Array<String>, values : Array<Float64>){
    var temp = values.clone()
	var last : Float64 = 0.0
	var c = 0
	while (c < keys.size()){
        var cur = temp[c]
        temp.set(c, cur+last)
		last = cur+last
		c++
	}
	return temp
}

func fastaRepeat(n_:Int64, seq:String){
	var seqi = 0
	var lenOut = 60
	var n = n_
	while (n > 0) {
	if (n<lenOut) {lenOut = n}
    if (seqi + lenOut < seq.size()) {
        print( seq.substring(seqi, lenOut) + "\n" );
        seqi += lenOut;
    } else {
        var s = seq.substring(seqi);
        seqi = lenOut - s.size();
        print( s + seq.substring(0, seqi) + "\n" );
    }	
   	n -= lenOut;
	}
}

func fastaRandom(n_:Int64, keys : Array<String>, values : Array<Float64>){
    var temp = makeCumulative(keys, values)
	var line = Array<String>(60,{x:Int64=>""})
	var n = n_
	while(n > 0){
		if (n < line.size()){line = Array<String>(n,{x:Int64=>""})}
		var x = 0
		while (x < line.size()){
			var r = rand()
			var y = 0
			while (y < keys.size()){
				if (r < temp.get(y).getOrThrow()){
					line.set(x,keys[y])
					break
				}
				y++
			}
			x++
		}
		for (i in line){
			print(i)
		}
		print("\n")
		n -= line.size()
	}
}

func main(){
	var n = 5000
	print(">ONE Homo sapiens alu\n")
	fastaRepeat(2*n, ALU)

	print(">TWO IUB ambiguity codes\n")
	fastaRandom(3*n, IUB_keys, IUB_values)

	print(">THREE Homo sapiens frequency\n")
	fastaRandom(5*n, HomoSap_keys, HomoSap_values)

}
