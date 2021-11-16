// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

foreign func rand() : Int64
func qsort_kernel(a : Array<Float64>, lo : Int64, hi :Int64) : Array<Float64> {
	var i = lo
	var j = hi
	var tmpLo = lo
	while (i < hi) {
		var pivot = a[(tmpLo+hi)/2]
		while (i <= j) {
			while (a[i] < pivot) {
				i += 1
			}
			while (a[j] > pivot) {
				j -= 1
			}
			if (i <= j) {
			  var tmp = a[i]
				a[i] = a[j]
				a[j] = tmp
				i += 1
				j -= 1
			}
		}
		if (tmpLo < hi) {
			qsort_kernel(a, tmpLo, j)
		}
		tmpLo = i
		j = hi
	}
	return a
}
func main() {
  var lst = Array<Float64>(5000000, 0.0)
  for (k in 0..lst.size) {
     unsafe { lst[k] = Float64(rand() % 32767) / 32767.0 }
     //print(lst[k].toString() + "\n")
  }
  qsort_kernel(lst, 0, lst.size-1)
  return 0
}
