<?php
class Application_Model_Users extends Zend_Db_Table_Abstract
{
    protected $_name = 'users';
    protected $_primary = 'id';
    protected $_rowClass = 'Application_Model_User';
}

?>