// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT:scan builtin condition 'os' do not support 'error'

@when[os == "error"]
func main() {
    return 0
}
