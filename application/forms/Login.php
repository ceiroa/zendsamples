<?php
class Application_Form_Login extends Zend_Form
{
    public function init()
    {
        $this->username = new Zend_Form_Element_Text('Username');
        $this->password = new Zend_Form_Element_Password('password');
    }
}