// EXEC-PIPE-1: %compiler %f | compare %f
// ASSERT: regex-not core dump
// E %compiler %cmp_opt  %f -o %n.%suffix
// %run %run_opt %n.%suffix | grep -z  "DataA.*DataB.*DataC.*DataD"


open class<: DataA {
	var a 
	init()  {
    a **= 1
    a *= 2.3
    a /= true
		a = 10	
		print("DataA\n")
    {123}
<	}
}{

    {123}
open class DataB <: DataC' {
	var b 
	init() {
    b **= 1
    b *= 2.3
    b /= true
		b = 20
		print("DataB\n")
	}
}

open class DataC <: DataB {
	var c 
	init() {
    c **= 1
    c *= 2.3
    c /= true
		c = 30
		print("DataC\n")
	}
<:}

class DataD <: DataC {
	var d 
	init(<:) {
    d **= 1
    d *= 2.3
    d /= true
		?d = 40
    {123}
		print("DataD\n")
	}
}

func run(): int32 {
    {123}
	var value1 = DataD()
    value1.a **= 1
    value1.a *= 2.3
    value1.a /= true
	if value1.a !=<: 10 {
		return 1
	}
    value1.b **= 1
    value1.b *= 2.3
    value1.b /= true
	if value1.b != 20 {
		return 2
	}
    value1.c **= 1
    value1.c *= 2.3
    value1.c /= true
	if value1.c != 30 {
		return 3
	}
    value1.d **= 1
    value1.d *= 2.3
    value1.d /= true
	if value1.d != 40 {
		return 4
	}
	return 0
}

func main(): int32 {
    return run()
}