<?php
final class Application_Model_Roles extends Zend_Db_Table_Abstract
{
    protected $_primary = 'id';
    
    const student = 'student';
    const teacher = 'teacher';
    const admin = 'admin';
}

?>