/***************************************日历 start******************************************
*
*变量定义  :date_start-date_end 时间范围,g_object 要填写时间的控件
            today当前日期  separator时间分界符   inover div层是否获得焦点
*mode      :时间变换的类型0-年 1-月 2-直接选择月
*demo      :<input type="text" name="birthday" onfocus="show_cele_date(this,'','',this)" title="abc">
*created   :2006.03.27 by lilong
*
****************************************日历 start******************************************/
var date_start,date_end,g_object
var today = new Date();
var separator="-";
var inover=false;

function change_date(temp,mode)
{
    var t_month,t_year
    if (mode){
        if(mode==1)
          t_month=parseInt(cele_date_month.value,10)+parseInt(temp,10);
        else
          t_month=parseInt(temp)
        if (t_month<cele_date_month.options(0).text) {
            cele_date_month.value=cele_date_month.options(cele_date_month.length-1).text;
            change_date(parseInt(cele_date_year.value,10)-1,0);
        }
        else{
            if (t_month>cele_date_month.options(cele_date_month.length-1).text){
                cele_date_month.value=cele_date_month.options(0).text;
                change_date(parseInt(cele_date_year.value,10)+1,0);
            }
            else
                {cele_date_month.value=t_month;
                 set_cele_date(cele_date_year.value,cele_date_month.value);
            }
        }
    }
    else{
        t_year=parseInt(temp,10);
        if (t_year<cele_date_year.options(0).text) {
            cele_date_year.value=cele_date_year.options(0).text;
            set_cele_date(cele_date_year.value,1);
        }
        else{
            if (parseInt(t_year,10)>parseInt(cele_date_year.options(cele_date_year.length-1).text,10)){
                cele_date_year.value=cele_date_year.options(cele_date_year.length-1).text;
                set_cele_date(cele_date_year.value,12);
            }
            else{
                cele_date_year.value=t_year;
                set_cele_date(cele_date_year.value,cele_date_month.value);
            }
        }
    }
}

//初始化日历
function init(d_start,d_end)
{
     var temp_str;
     var i=0
     var j=0
     date_start=new Date(1980,7,1)
     date_end=new Date(2006,8,1)
     document.writeln("<div name=\"cele_date\" id=\"cele_date\" style=\"display:none\" style=\"LEFT: 69px; POSITION: absolute; TOP: 159px;Z-INDEX:99\" onClick=\"event.cancelBubble=true;\" onBlur=\"hilayer()\" onMouseOut=\"lostlayerfocus()\">-</div>");
     window.cele_date.innerHTML="";
     temp_str="<table border=\"1\" bgcolor=\"#DDDDDD\" bordercolor=\"white\"><tr align='center'><td colspan=7 onmouseover=\"overcolor(this)\">";
     temp_str+="<input type=\"Button\" value=\"<<\" onclick=\"change_date(-1,1)\" onmouseover=\"getlayerfocus()\" style=\"color: #000099; background-color: #cccccc; cursor: hand; border:1px solid #ffffff\">-";

     temp_str+=""
     temp_str+="<select name=\"cele_date_year\" id=\"cele_date_year\" language=\"javascript\" onchange=\"change_date(this.value,0)\" onmouseover=\"getlayerfocus()\" onblur=\"getlayerfocus()\" style=\"font-size: 9pt; border: 1px #666666 outset; background-color: #F4F8FB\">"

     for(i=1900;i<=today.getYear()+10;i++)
     {
     	temp_str+="<OPTION value=\""+i.toString()+"\">"+i.toString()+"</OPTION>";
     }
     temp_str+="</select>-";
     temp_str+=""
     temp_str+="<select name=\"cele_date_month\" id=\"cele_date_month\" language=\"javascript\" onchange=\"change_date(this.value,2)\" onmouseover=\"getlayerfocus()\" onblur=\"getlayerfocus()\" style=\"font-size: 9pt; border: 1px #666666 outset; background-color: #F4F8FB\">"

     for (i=1;i<=12;i++)
     {
     	temp_str+="<OPTION value=\""+i.toString()+"\">"+i.toString()+"</OPTION>";
     }
     temp_str+="</select>-";
     temp_str+=""
     temp_str+="<input type=\"Button\" value=\">>\" onclick=\"change_date(1,1)\" onmouseover=\"getlayerfocus()\"  style=\"color: #000099; background-color: #cccccc; cursor: hand; border:1px solid #ffffff\">";

     temp_str+="</td></tr><tr align='center'><td onmouseover=\"overcolor(this)\">"
     temp_str+="<font color=red>日</font></td><td>";
     temp_str+="一</td><td>"; 
     temp_str+="二</td><td>"; 
     temp_str+="三</td><td>"
     temp_str+="四</td><td>";
     temp_str+="五</td><td>"; 
     temp_str+="六</td></tr>";
     for (i=1 ;i<=6 ;i++)
     {
        temp_str+="<tr align='center'>";
        for(j=1;j<=7;j++){
            temp_str+="<td name=\"c"+i+"_"+j+"\" id=\"c"+i+"_"+j+"\" style=\"CURSOR: hand\" style=\"COLOR:#000000\" language=\"javascript\" onmouseover=\"overcolor(this)\" onmouseout=\"outcolor(this)\" onclick=\"td_click(this)\">?</td>"
        }
        temp_str+="</tr>"        
     }
     temp_str+="</td></tr>";

     temp_str+="<tr style=\"font-size:9pt\"><td colspan=7 align='center' valign='middle'>今天: ";
     temp_str+="<span style=\"CURSOR: hand\" onmouseover=\"overcolor(this)\" onmouseout=\"outcolor(this)\" kind=\"today\" onclick=\"td_click(this)\">"+getNow()+"</span>";
     temp_str+=" &nbsp;&nbsp;<span style=\"CURSOR: hand\" onmouseover=\"overcolor(this)\" onmouseout=\"outcolor(this)\" kind=\"clear\" onclick=\"td_click(this)\">清空</span></td></tr>";

     temp_str+="</table>";
     window.cele_date.innerHTML=temp_str;
}

function set_cele_date(year,month)
{
   var i,j,p,k
   var nd=new Date(year,month-1,1);
   event.cancelBubble=true;
   cele_date_year.value=year;
   cele_date_month.value=month;
   k=nd.getDay()-1
   var temp;
   for (i=1;i<=6;i++)
      for(j=1;j<=7;j++){
        eval("c"+i+"_"+j+".innerHTML=\"\"");
        eval("c"+i+"_"+j+".bgColor=\"#DDDDDD\"");
        eval("c"+i+"_"+j+".style.cursor=\"hand\"");
      }
   while(month-1==nd.getMonth()){
      j=(nd.getDay() +1);
      p=parseInt((nd.getDate()+k) / 7)+1;
      eval("c"+p+"_"+j+".innerHTML="+"\""+nd.getDate()+"\"");
      if ((nd.getDate()==today.getDate())&&(cele_date_month.value==today.getMonth()+1)&&(cele_date_year.value==today.getYear())){
      	 eval("c"+p+"_"+j+".bgColor=\"#FFCC00\"");
      }
      if (nd>date_end || nd<date_start){
         eval("c"+p+"_"+j+".bgColor=\"#bbbbbb\"");
         eval("c"+p+"_"+j+".innerHTML=\"&nbsp;\"");
         eval("c"+p+"_"+j+".style.cursor=\"text\"");
      }
      nd=new Date(nd.valueOf() + 86400000)
    }
}

//eP:点击的对象; d_start-d_end有效的时间区段; t_object:需要存放值的控件；by fujun
function show_cele_date(eP,d_start,d_end,t_object)
{
window.cele_date.style.display="";
window.cele_date.style.zIndex=99
var s,cur_d
var eT = eP.offsetTop;
var eH = eP.offsetHeight;
var dH = window.cele_date.style.pixelHeight;
var sT = document.body.scrollTop;
var sL = document.body.scrollLeft;
event.cancelBubble=true;
window.cele_date.style.posLeft = event.clientX-event.offsetX+sL-5;
window.cele_date.style.posTop = event.clientY-event.offsetY+eH+sT-5;
//window.cele_date.style.posLeft = event.clientX;
//window.cele_date.style.posTop = event.clientY;

if ((window.cele_date.style.posLeft+window.cele_date.clientWidth)>document.body.clientWidth)
    window.cele_date.style.posLeft+=eP.offsetWidth-window.cele_date.clientWidth;
if (d_start!=""){
    if (d_start=="today"){
        date_start=new Date(today.getYear(),today.getMonth(),today.getDate());
    }else{
        s=d_start.split(separator);
        date_start=new Date(s[0],s[1]-1,s[2]);
    }
}else{
    date_start=new Date(1900,1,1);
}

if (d_end!=""){
    s=d_end.split(separator);
    date_end=new Date(s[0],s[1]-1,s[2]);
}else{
    date_end=new Date(3000,1,1);
}

g_object=t_object

cur_d=new Date()
set_cele_date(cur_d.getYear(),cur_d.getMonth()+1);
window.cele_date.style.display="block";
window.cele_date.focus();
}

function set_date_clear(){
  g_object.value="";
}
function td_click(t_object){
  var t_d
  if(t_object.kind=="clear"){
      g_object.value="";
      h_cele_date();
  }
  else if(t_object.kind=="today"){
      g_object.value=t_object.innerHTML;
      h_cele_date();
  }
  else
  if (parseInt(t_object.innerHTML,10)>=1 && parseInt(t_object.innerHTML,10)<=31 ){
    t_d=new Date(cele_date_year.value,cele_date_month.value-1,t_object.innerHTML)
    if (t_d<=date_end && t_d>=date_start){
      var year = cele_date_year.value;
      var month = cele_date_month.value;
      var day = t_object.innerHTML;
      if (parseInt(month)<10)
        month = "0" + month;
      if (parseInt(day)<10)
        day = "0" + day;
      g_object.value=year+separator+month+separator+day;
      window.cele_date.style.display="none";
    }
  }
}

function h_cele_date(){
   window.cele_date.style.display="none";
}
function overcolor(obj)
{
  if (obj.style.cursor=="hand") obj.style.color = "#FFFFFF";
  inover=true;
  window.cele_date.focus();
}
function outcolor(obj)
{
	obj.style.color = "#000000";
	inover=false;
}
function getNow(){
    var Stamp=new Date();
    var year = Stamp.getYear();
    var month = Stamp.getMonth()+1;
    var day = Stamp.getDate();
    if(month<10){
	month="0"+month;
    }
    if(day<10){
	day="0"+day;
    }
    return year+separator+month+separator+day;
}
function hilayer()
{
	if (inover==false)
	{
		var lay=document.all.cele_date;
		lay.style.display="none";
	}
}
function getlayerfocus()
{
	inover=true;
}
function lostlayerfocus()
{
	inover=false;
}
init();
/***************************************日历结束 end*******************************************/