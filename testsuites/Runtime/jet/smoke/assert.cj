// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex return type of entry function 'main' is not 'Integer' or 'Unit'

func main():String{}
