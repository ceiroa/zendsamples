<?php

class Application_Form_Login extends Zend_Form
{
    public function init()
    {
        $this->username = new Zend_Form_Element_Text('Username');
        $this->username->setLabel('Username')->setRequired(true)
             ->setErrorMessages(array('Username is required'));
        
        $this->password = new Zend_Form_Element_Password('password');
        $this->password->setLabel('Password')->setRequired(true)
             ->setErrorMessages(array('Password is required'));
        
        $this->submit = new Zend_Form_Element_Submit('submit');
    }
}