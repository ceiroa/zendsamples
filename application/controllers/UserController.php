<?php

class UserController extends Zend_Controller_Action implements Zend_Acl_Role_Interface
{

    public function getRoleId()
    {
        
    }

    public function __construct( Zend_Controller_Request_Abstract $request, 
                    Zend_Controller_Response_Abstract $response, array $invokeArgs = array() )
    {
        
    }
       
    public function loginAction()
    {
        $request = $this->getRequest();
        $loginForm = new Application_Form_Login();
        
        if ($request->isPost() && $loginForm->isValid($request->getPost())) {
        
            $authAdapter = new Application_Auth_UserAdapter(
                            $loginForm->username->getValue(),
                            $loginForm->password->getValue()
            );
            
            $auth = Zend_Auth::getInstance();
            $authResult = $auth->authenticate($authAdapter);
            
            if ($authResult->isValid()) {
                $this->_forward('index', 'index');
            } else {
                $this->_helper->FlashMessenger->addMessage(Application_Form_Login::$errorMessage);
            }
        }
        $this->view->flashMessages = $this->_helper->FlashMessenger->getCurrentMessages();
        $this->_helper->flashMessenger->clearCurrentMessages();
        $this->view->loginForm = $loginForm;
    }
       
    public function logoutAction()
    {
        Zend_Auth::getInstance()->clearIdentity();
    }
}