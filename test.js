var longestPalindrome = function (s = "")
{
    let subs = s.split('').reverse()
    return subs.map((str, ind) => str == s[ind] ? s[ind] : '').filter((val) => val != "").join('')
};
var reverse = function (x)
{
    y = `${x}`.split('').reverse().join('')
    z = `${x * -1}`.split('').reverse().join('')
    pow = Math.pow(2, 31)
    return x > 0 ? y - "0" >= pow - 1 ? 0 : y - "0" : - z - "0" <= -pow ? 0 : - z
};
console.log(reverse(-214));
var myAtoi = function (s = '')
{
    let x = s.replace(/[^-?\d]/gi, "") - "0"
    return x != null ? x > Math.pow(2, 31) - 1 || x < -Math.pow(2, 31) ? 0 : x : 0
};
console.log(myAtoi("214"));
//2147483647
//1534236469