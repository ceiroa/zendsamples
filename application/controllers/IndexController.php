<?php

class IndexController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        // action body
        $user = Zend_Auth::getInstance()->getIdentity();
        $this->view->user = $user;
    }


}

