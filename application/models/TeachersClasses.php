<?php
class TeachersClasses extends Zend_Db_Table_Abstract
{

    protected $_referenceMap = array(
        
        'Teachers' => array(
            'columns' => 'teacher_id' , 
            'refTableClass' => 'Students' , 
            'refColumns' => 'teacher_id'
        ) , 
        'Classes' => array(
            'columns' => 'class_id' , 
            'refTableClass' => 'Classes' , 
            'refColumns' => 'class_id'
        )
    );
}

?>