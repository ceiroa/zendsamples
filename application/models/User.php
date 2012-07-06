<?php
class Application_Model_User extends Zend_Db_Table_Row_Abstract implements Zend_Acl_Role_Interface
{
	/**
	 * Return the role id for use in Zend_Acl.  This method is required to
	 * satisfy Zend_Acl_Role_Interface.
	 */
	public function getRoleId()
	{
		return $this->getRole();
	}
	
	/**
	 * Return the role of the user.
	 * @return string Either "student", "teacher" or "admin"
	 */
	public function getRole()
	{
		return $this->role;
	}
	
	/**
	 * Determine whether the provided plaintext password is valid for this user.
	 * @param string $password The plaintext password to verify
	 * @return bool True if the password is correct, false otherwise
	 */
	public function isPassword($password)
	{
	    return $this->_hashPassword($password) == $this->password;
	}
	
	/**
	 * Return the hashed version of a plaintext password.
	 * @param string $password The plaintext password to hash
	 * @return string A hashed version of $password
	 */
	protected function _hashPassword($password)
	{
	    return md5($password);
	}
	
	/**
	 * Change the user's password
	 * @param string $password The plaintext password to use as the user's new password
	 * @return void
	 */
	public function setPassword($password)
	{
	    $this->password = $this->_hashPassword($password);
	}

}