// ERRCHECK: %compiler -config="(a=1,b=2)" %cmp_opt %f -o %output
// ASSERT: scan conditional compilation have not supported this condition: 'c'

@when[a=="1"&&b=="2"&&c=="3"]
func main(){
    0
}