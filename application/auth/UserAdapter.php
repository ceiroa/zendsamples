<?php
class Application_Auth_UserAdapter implements Zend_Auth_Adapter_Interface
{
    private $username;
    private $password;
    private $role;
    
    public function __construct($username, $password, $role)
    {
        $this->username = $username;
        $this->password = $password;
        $this->role = $role;
    }
    
    public function authenticate()
    {
        $users = new Application_Model_User();
        
        $foundUsers = $users->findByUserByUsername($this->username);
        
        if (count($foundUsers) == 0)
            return new Zend_Auth_Result(Zend_Auth_Result::FAILURE_IDENTITY_NOT_FOUND, null);
        
        if (count($foundUsers) > 1)
            return new Zend_Auth_Result(Zend_Auth_Result::FAILURE_IDENTITY_AMBIGUOUS, null);
        
        $user = $foundUsers->current();
        
        if (!$user->isPassword($this->password))
            return new Zend_Auth_Result(Zend_Auth_Result::FAILURE_CREDENTIAL_INVALID, null);
        
        return new Zend_Auth_Result(Zend_Auth_Result::SUCCESS, $user);
    }
}