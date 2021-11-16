// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import io.*

let BUFFER_SIZE = 8192
var buf = Array<UInt8>(BUFFER_SIZE,{x:Int64=>UInt8(0)})
var bufLen = 0
var size = 0
var fac = 0.0
var shift = 0
var fs : FileStream = FileStream("./mandelbrot.txt",WriteOnly)

func compute(){

	var a = "P4\n${size} ${size}\n"
	var t = Array<UInt8>(a.size(),{x:Int64=>UInt8(0)})
	var count = 0
	for (i in a.utf8View){
		t.set(count,i)
		count ++
	}
	var temp = Array<UInt8>(t)


	fs.write(temp,0,temp.size())
	var y = 0
	while (y < size){
		computeRow(y)
		y++
	}
	fs.write(Array<UInt8>(buf),0,bufLen)

	fs.close()
}

var i = 50

func do_i(){
	i--;
	return i > 0
}

func computeRow(y:Int64) {
	var bits : UInt8 = 0
	let Ci : Float64 = (Float64(y) * fac - 1.0)
	var bufLocal = buf
	var x = 0
	while (x < size){
		var Zr = 0.0
		var Zi = 0.0
		var Cr = (Float64(x) * fac - 1.5)
		i = 50
		var ZrN = 0.0
		var ZiN = 0.0
		do {
			Zi = 2.0 * Zr * Zi + Ci;
			Zr = ZrN - ZiN + Cr;
	        ZiN = Zi * Zi;
         	ZrN = Zr * Zr;
			
		} while (!(ZiN + ZrN > 4.0) && do_i())
		bits = bits << 1
		if (i == 0) {bits ++}
		if (x % 8 == 7){
			bufLocal.set(bufLen, bits)
			bufLen++
			if (bufLen == BUFFER_SIZE) {
				fs.write(Array<UInt8>(bufLocal),0,BUFFER_SIZE)
				bufLen = 0
			}
			bits = 0
		}
		x++
	}
	if (shift != 0){
		bits = bits << shift
		bufLocal.set(bufLen,bits)
		bufLen++
		if (bufLen == BUFFER_SIZE) {
						fs.write(Array<UInt8>(bufLocal),0,BUFFER_SIZE)
                        bufLen = 0
                }

	}	
}


func main(){
	let n = 200
	size = n
	fac = 2.0 / Float64(size)
	if (size % 8 == 0){
		shift = 0
	} else {
		shift = (8 - shift % 8)
	}
	if(fs.openFile()){
	compute()
	}
	
	return 0
}
