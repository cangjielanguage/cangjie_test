// EXEC: %compiler -config %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan option '-config' requires some values, format: option=value or option="v1, v2..."

func main(){0}