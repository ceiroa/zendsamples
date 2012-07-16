<?php

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap
{
    
    public function _initAutoload()
    {
        $resourceLoader = new Zend_Application_Module_Autoloader(array(
        'namespace' => 'Application',
        'basePath' => APPLICATION_PATH
        ));
        $resourceLoader->addResourceType('auth', 'auth/', 'Auth');
        $resourceLoader->addResourceType('exception', 'exceptions/', 'Exception');
        $resourceLoader->addResourceType('form', 'forms/', 'Form');
        return $resourceLoader;
    }
    
    /**
     *
     * Initialize the config into the registry
     */
    protected function _initConfig()
    {
        Zend_Registry::set('Application_Ini', $this->getOptions());
    }

}

