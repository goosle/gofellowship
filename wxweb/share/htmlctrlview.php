<?php

function controlID($fieldName)
   {
   echo ' name="'.$fieldName
        .'" id="'.$fieldName.'" ';
   }
function displayField($fieldTitle,$fieldValue,$titleAttr="",$valueAttr="")
   {
   if(!empty($fieldTitle))
     echo '<span class="field-title" '.$titleAttr.'>'.$fieldTitle."</span>:&nbsp";
   echo '<span class="field-value" '.$valueAttr.'>'.$fieldValue."</span>";
   }
function displayFieldArea($fieldTitle,$fieldValue,$titleAttr="",$valueAttr="")
   {
   if(!empty($fieldTitle))
     echo '<span class="field-title" '.$titleAttr.'>'.$fieldTitle."</span></br>";
   echo '<span class="field-value" '.$valueAttr.'>'.$fieldValue."</span>";
   }

function inputText($fieldName,$fieldValue="",$attr="")
    {
    //input text control
    echo '<input type="text"  class="field-input" name="'
          .$fieldName
          .'" id="'
          .$fieldName
          .'"  '.$attr." ";


    if(!empty($fieldValue))
      {//input fieldvalue
      echo 'value="'.$fieldValue.'"'; 
      }
     echo '/>';
    }

function inputPwd($fieldName,$fieldValue="",$attr="")
    {
    //input text control
    echo '<input type="password"  class="field-input" name="'
          .$fieldName
          .'" id="'
          .$fieldName
          .'"  '.$attr." ";
    if(!empty($fieldValue))
      {//input fieldvalue
      echo 'value="'.$fieldValue.'"'; 
      }
     echo '/>';
    }
    
function inputArea($fieldName,$fieldValue="",$attr="")
    {
    //input text control
 
    echo '<textarea  class="field-input-area" name="'
          .$fieldName
          .'" id="'
          .$fieldName
          .'"  '.$attr.'>';
    if(!empty($fieldValue))
      {//input fieldvalue
      echo $fieldValue; 
      }
   echo "</textarea>";
   }
    

function inputSelect($fieldName,$enumVals,$fieldValue="",$attr="")
    {
    //input text control
    echo '<select class="field-input-select" name="'
          .$fieldName
          .'" id="'
          .$fieldName
          .'"  '.$attr.'>';

    $needSel=!empty($fieldValue);
    foreach($enumVals as $key=>$value)
      {
      echo '<option value="'.$key.'"';
      if($needSel&&$fieldValue==$key)
        {
        echo " selected ";
        $needSel=false;
        }
      echo ">".$value."</option>";
      }
    
    echo "</select>";
    }

function  inputCheckBox($fieldName,$fieldValue="",$attr="",$checkvalue="1")
    {
    echo  '<input type="checkbox" class="field-input-checkbox" name="';
    echo  $fieldName.'"id="'.$fieldName.'" '.$attr;
    if(!empty($fieldValue)&&$fieldValue)
      {
      echo " checked ";
      }
    
    echo 'value="'.$checkvalue.'"  />';

    }

?>