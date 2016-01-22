<?php
class ViewPage{
var $table;
var $fieldList;
var $maxLine=15;
var $offset;
var $total;
var $number;
var $totalPage;
var $curPage;
var $queryCondition;
var $pageQuery;

var $strPageFirst="首页";
var $strPagePrev="前页";
var $strPageNext="下页";
var $strPageLast="尾页";

var $strDispPageFirst;
var $strDispPagePrev;
var $strDispPageNext;
var $strDispPageLast;

function ViewPage($tb,$ml,$of,$fl="*")
//****************
//@1 table name
//@2 max line in a page
//@3 record offset
  {
  $this->fieldList=$fl;
  $this->table=$tb;
  $this->maxLine=$ml;
  $this->offset=floor($of/$ml)*$ml;
  }
//@1 sql where conditon
function setQueryCondition($s)
  {
  $this->queryCondition=$s;
  }
function setParamValue($key,$value)
  {
  $tmp["key"]=$key;
  $tmp["value"]=$value;
  $this->pageQuery[]=$tmp;
  }
 //set page display lable 
 //sucsh as first or <img src=first.gif align=absmiddle>
 function setPageFirst($s,$sd="")
   {
   $this->strPageFirst=$s;
   $this->strDispPageFirst=$sd;
   }
   
 function setPagePrev($s,$sd="")
   {
   $this->strPagePrev=$s;
   $this->strDispPagePrev=$sd;
   }
   
 function setPageNext($s,$sd="")
   {
   $this->strPageNext=$s;
   $this->strDispPageNext=$sd;
   }  
 function setPageLast($s,$sd="")
   {
   $this->strPageLast=$s;
   $this->strDispPageLast=$sd;
   } 
//calulate current page by conditon
function calculatePages($cnn)
  {
  $sql="select count(*) as total from ".$this->table." ".$this->queryCondition;
  $result=mysqli_query($cnn,$sql);
  if(!$result)
    {
    err_log(mysqli_error($cnn),__FILE__,__LINE__);
    }
  $row=mysqli_fetch_array($result);
  $this->total=$row["total"];
  $this->totalPage=ceil($this->total/$this->maxLine);
  $this->curPage=$this->offset/$this->maxLine+1;
  }

   
//return all page data
function getRecords($cnn)
  {

  $sql="select count(*) as total from ".$this->table." ".$this->queryCondition;

  $result=mysqli_query($cnn,$sql);
  if(!$result)
    {
    err_log(mysqli_error($cnn),__FILE__,__LINE__);
    exit();
    }
  $row=mysqli_fetch_array($result);
  $this->total=$row["total"];
  $this->totalPage=ceil($this->total/$this->maxLine);
  $this->curPage=$this->offset/$this->maxLine+1;
  $this->result=array();
  if($this->total>0)
    {
    $sql="select $this->fieldList from ".$this->table." ".$this->queryCondition
            ." limit ".$this->offset." ,".$this->maxLine;
    $result=mysqli_query($cnn,$sql) ;

    if(!$result)
      {
      error_log(mysqli_error($cnn),__FILE__,__LINE__) ;
      err_log(" inner server error ,please context the author .",__FILE__,__LINE__);
      }
    $this->number==mysqli_num_rows($result);
    while($row=mysqli_fetch_array($result))
      $this->result[]=$row;
    }
 
    
  return $this->result;
  }   
  
function getPages($s=0)
  {
  switch($s)
  {
  case 1:
    return $this->curPage;
  case 2:
    return $this->totalPage;
  default:
    return "第 ".$this->curPage."/".$this->totalPage." 页 .";
  }
  }  

function getTotal()
  {
  return $this->total;
  }  
 //user use page input method ,
 //can use <form action=$PHP_SELF>  
function inputPageLines($type=0,$iMin=1,$iMax=30)
  {
  if($type==1)
    {
    echo '<select name="pageline">';
    for($i=$iMin;$i<$iMax;++$i)
      {
      if($i==$this->maxLine)
        echo '<option value='.$i.' selected>'.$i.'</option>';
      else
        echo '<option value='.$i.'>'.$i.'</option>';
      }
    echo '</select>';
    }
  else
    echo '<input type=text size=2 maxlength=3 name=pageline value='
            .$this->maxLine.'>';
  }
  
  
function selectPage()
  {
  echo '<select size=1 name="offset">';
  for($i=0;$i<$this->totalPage;$i++)
    {
    if($this->totalPage>1)
      {
      if($this->offset==$i*$this->maxLine)
        echo '<option value='
                .($i*$this->maxLine)
                .' selected> 第 '
                .($i+1)
                .' 页</option>';
      else
        echo '<option value='
        .($i*$this->maxLine)
        .'>第 '.($i+1).'页 </option>';
      }
    }
  echo '</select>';
  $k=count($this->pageQuery);
  for($i=0;$i<$k;++$i)
    echo '<input type="hidden" name="'.$this->pageQuery[$i]["key"]
                 .'" value="'.$this->pageQuery[$i]["value"].'">';
  }  
  
function showNavigator()
  {
  $outstr="";
  $first=0;
  $prev=$this->offset-$this->maxLine;
  $next=$this->offset+$this->maxLine;
  $last=($this->totalPage-1)*$this->maxLine;
  
  $k=count($this->pageQuery);
  $strQuery="";
  for($i=0;$i<$k;++$i)
    {
    $strQuery.="&".$this->pageQuery[$i]["key"]
                 ."=".$this->pageQuery[$i]["value"];
    }
//first page
  if($this->offset>=$this->maxLine)
    {
    $outstr.="<a href=\""
                .$_SERVER["PHP_SELF"]
                ."?offset=$first&pageline=$this->maxLine$strQuery\">$this->strPageFirst</a>|";    }
  else
    $outstr.=$this->strPageFirst."|";
    //pre page
  if($prev>=0)
    $outstr.="<a href=\""
                .$_SERVER["PHP_SELF"]
                ."?offset=$prev&pageline=$this->maxLine$strQuery\">$this->strPagePrev</a>|";
  else
    $outstr.=$this->strPagePrev."|";    
  
 //next page 
  if($next<$this->total)
    {
    $outstr.='<a href="'
                .$_SERVER["PHP_SELF"]
                .'?offset='
                .$next
                ."&pageline="
                .$this->maxLine.$strQuery
                ."\">"
                .$this->strPageNext
                ."</a>|";
    }  
  else
    $outstr.=$this->strPageNext."|";
    // last page
  if(       $this->totalPage!=0
      && $this->curPage<$this->totalPage)
    $outstr.="<a href=\""
                .$_SERVER["PHP_SELF"]
                ."?offset="
                .$last
                ."&pageline="
                .$this->maxLine.$strQuery
                ."\">"
                .$this->strPageLast
                ."</a>";
  else
    $outstr.=$this->strPageLast;
    
  return $outstr;
  }  
  
function showPageBar()
  {
  echo '&nbsp<span>'.$this->getPages().'&nbsp'.$this->showNavigator().'&nbsp ';
  }  
function showFullFunc($barBgColor="")
  {
  
  echo '<table width=100% cellspacing=0 cellpadding=0 border=0>';
  echo '<form action="'.$_SERVER["PHP_SELF"].'"method="GET">';
  echo '<tr >';
  echo '<td align="left">';
  echo $this->showNavigator().' &nbsp';
  echo " 共有 ".$this->getTotal()." 条纪录。";
  echo '</td>';
 
  echo '<td width=45% align=right>';
 /*
  echo ' 每页';
 $this->inputPageLines(1);
 echo ' 条 ， ';
  if($this->totalPage>1)
    echo '&nbsp去';
*/
 echo $this->getPages().'&nbsp到';
  $this->selectPage();  
  echo '<input type=submit value="跳转">';
  echo '&nbsp;</td>';
  echo '</tr></form></table>';
  
  }  


function showNavigator_ajax($target)
  {
  
  $outstr="";
  $first=0;
  $prev=$this->offset-$this->maxLine;
  $next=$this->offset+$this->maxLine;
  $last=($this->totalPage-1)*$this->maxLine;
  
  $k=count($this->pageQuery);
  $strQuery="";
  for($i=0;$i<$k;++$i)
    {
    $strQuery.="&".$this->pageQuery[$i]["key"]
                 ."=".$this->pageQuery[$i]["value"];
    }
 $linkstr='<a class="ajax-action" target="'.$target.'" href=" " link="';
//first page
  if($this->offset>=$this->maxLine)
    {
    $outstr.=$linkstr
                .$_SERVER["PHP_SELF"]
                ."?offset=$first&pageline=$this->maxLine$strQuery\">$this->strPageFirst</a>|";    }
  else
    $outstr.=$this->strPageFirst."|";
    //pre page
  if($prev>=0)
    $outstr.=$linkstr
                .$_SERVER["PHP_SELF"]
                ."?offset=$prev&pageline=$this->maxLine$strQuery\">$this->strPagePrev</a>|";
  else
    $outstr.=$this->strPagePrev."|";    
  
 //next page 
  if($next<$this->total)
    {
    $outstr.=$linkstr
                .$_SERVER["PHP_SELF"]
                .'?offset='
                .$next
                ."&pageline="
                .$this->maxLine.$strQuery
                ."\">"
                .$this->strPageNext
                ."</a>|";
    }  
  else
    $outstr.=$this->strPageNext."|";
    // last page
  if(       $this->totalPage!=0
      && $this->curPage<$this->totalPage)
    $outstr.=$linkstr
                .$_SERVER["PHP_SELF"]
                ."?offset="
                .$last
                ."&pageline="
                .$this->maxLine.$strQuery
                ."\">"
                .$this->strPageLast
                ."</a>";
  else
    $outstr.=$this->strPageLast;
    
  return $outstr;
  } 


function showFullFunc_ajax($target,$barName="")
  {    
  echo '<div class="data-nav-bar" id="data-nav-bar_'.$barName.'">';
  echo $this->getPages();
  echo $this->showNavigator_ajax($target).' &nbsp';
  echo '</div>';
?>
<script type="text/javascript" language="javascript">
$(document).ready(function() {
 <?php echo   '$("#data-nav-bar_'.$barName.' a.ajax-action").each(function() {'; ?>
         $(this).click(function(ev) {
            gsl.ajaxLink(ev,this);
            } );
        });
    });
</script>
<?php
  }
}
?>