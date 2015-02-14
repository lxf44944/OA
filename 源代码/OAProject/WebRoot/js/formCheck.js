//字符处理;
//去左右空格;
function trim(s){
     return rtrim(ltrim(s));
}
//去左空格;
function ltrim(s){
     return s.replace( /^\s*/, "");
}
//去右空格;
function rtrim(s){
     return s.replace( /\s*$/, "");
}
//过滤HTML字符
function HTML(text){
    text = text.replace(/&/g, "&");
//    text = text.replace(/"/g, """);
    text = text.replace(/</g, "<");
    text = text.replace(/>/g, ">");
    text = text.replace(/'/g, "’");
    return text ;
}
//还原HTML字符
function ReHTML(text){
    text = text.replace(/&/g, "&");
//    text = text.replace(/"/g, '"');
//    text = text.replace(/</g, "<");
    text = text.replace(/>/g, ">");
    text = text.replace(/’/g, "'");
    return text ;
}
// 判断中英文混排时候的长度
function byteLength (sStr) {
    aMatch = sStr.match(/[^\x00-\x80]/g);
    return (sStr.length + (! aMatch ? 0 : aMatch.length));
}

//验证信息;
//空字符值;
function isEmpty(s){
    s = trim(s);
    return s.length == 0;
}
//Email;
function isEmail(s){
    s = trim(s);
     var p = /^[_\.0-9a-z-]+@([0-9a-z][0-9a-z-]+\.){1,4}[a-z]{2,3}$/i;
     return p.test(s);
}
//数字;
function isNumber(s){
    return !isNaN(s);
}
//颜色值;
function isColor(s){
    s = trim(s);
    if (s.length !=7) return false;
    return s.search(/\#[a-fA-F0-9]{6}/) != -1;
}
//手机号码;
function isMobile(s){
    s = trim(s);
    var p = /13\d{9}/;
    return p.test(s);
}
//身份证;
function isCard(s){
    s = trim(s);
    var p = /^\d{15}(\d{2}[xX0-9])?$/;
    return p.test(s);
}
//URL;
function isURL(s){
    s = trim(s).toLowerCase();
    var p = /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/;
    return p.test(s);
}
//Phone;
function isPhone(s){
    s = trim(s);
    var p = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{7,8}$/; 
    return p.test(s);
}
//Zip;
function isZip(s){
    s = trim(s);
    var p = /^[1-9]\d{5}$/;
    return p.test(s);
}
//Double;
function isDouble(s){
    s = trim(s);
    var p = /^[-\+]?\d+(\.\d+)?$/;
    return p.test(s);
}
//Integer;
function isInteger(s){
    s = trim(s);
    var p = /^[-\+]?\d+$/;
    return p.test(s);
}
//English;
function isEnglish(s){
    s = trim(s);
    var p = /^[A-Za-z]+$/;
    return p.test(s);
}
//中文;
function isChinese(s){
    s = trim(s);
    var p = /^[\u0391-\uFFE5]+$/;
    return p.test(s);
}
//双字节
function isDoubleChar(s){
    var p = /^[^\x00-\xff]+$/;
    return p.test(s);
}
//含有中文字符
function hasChineseChar(s){
    var p = /[^\x00-\xff]/;
    return p.test(s);
}
//15位以内字母，数字，下划线
function hasAccountChar(s){
    var p = /^[a-zA-Z0-9][a-zA-Z0-9_-]{0,15}$/;
    return p.test(s);
}
//限定长度
function limitLen(s,Min,Max){
    s=trim(s);
    if(s=="") return false;
    if((s.length<Min)||(s.length>Max))
        return false;
    else
        return true;
}

