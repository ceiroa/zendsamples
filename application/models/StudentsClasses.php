<?php
class Application_Model_StudentsClasses extends Zend_Db_Table_Abstract
{
    protected $_referenceMap = array(
        
        'Students' => array(
            'columns' => 'student_id' , 
            'refTableClass' => 'Students' , 
            'refColumns' => 'student_id'
        ) , 
        'Classes' => array(
            'columns' => 'class_id' , 
            'refTableClass' => 'Classes' , 
            'refColumns' => 'class_id'
        )
    );
}