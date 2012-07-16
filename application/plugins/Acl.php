<?php 
class Application_Plugin_Acl extends Zend_Controller_Plugin_Abstract
{
    /**
     * The access control list
     */
    private $_acl;
    
    /**
     * Set up the access control list
     */
    public function __construct()
    {
        $this->_acl = new Zend_Acl();
        
        $this->_acl->addRole('student');
        $this->_acl->addRole('teacher');
        $this->_acl->addRole('adming');
        
        $this->_acl->addResource('index');
        $this->_acl->addResource('error');
        $this->_acl->addResource('classes');
        $this->_acl->addResource('students');
        $this->_acl->addResource('teachers');
    }
    
    /**
     * Check the logged in user using Zend_Auth and verify they have access to
     * the requested controller and action
     * @return void
     */
    public function preDispatch(Zend_Controller_Request_Abstract $request)
    {
        
    }
}