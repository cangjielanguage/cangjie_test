

module.exports = function isMoment(module1) { 
  if (module1.bo || module1.str != "true" || module1.num != 0) {
      return 1
  }
  if (module1.fun(8) != 8) {
      return 1
  }
  return 0
}