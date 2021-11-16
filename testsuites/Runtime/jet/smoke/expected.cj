// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): String{} // EXPECTED: regex return type of entry function 'main' is not 'Integer' or 'Unit'
