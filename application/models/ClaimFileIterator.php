<?php
/*****************************************************************************
*       ClaimFileIterator.php
*
*       Author:  ClearHealth Inc. (www.clear-health.com)        2009
*       
*       ClearHealth(TM), HealthCloud(TM), WebVista(TM) and their 
*       respective logos, icons, and terms are registered trademarks 
*       of ClearHealth Inc.
*
*       Though this software is open source you MAY NOT use our 
*       trademarks, graphics, logos and icons without explicit permission. 
*       Derivitive works MUST NOT be primarily identified using our 
*       trademarks, though statements such as "Based on ClearHealth(TM) 
*       Technology" or "incoporating ClearHealth(TM) source code" 
*       are permissible.
*
*       This file is licensed under the GPL V3, you can find
*       a copy of that license by visiting:
*       http://www.fsf.org/licensing/licenses/gpl.html
*       
*****************************************************************************/


class ClaimFileIterator extends WebVista_Model_ORMIterator implements Iterator {

	public function __construct($dbSelect = null,$autoLoad = false) {
		$this->_ormClass = 'ClaimFile';
		// autoLoad gives an option to query the entire rows which takes time if more data in the table
		if ($autoLoad) {
			parent::__construct($this->_ormClass,$dbSelect);
		}
	}

	public function setFilters($filters) {
		$db = Zend_Registry::get('dbAdapter');
		$ormClass = $this->_ormClass;
		$orm = new $ormClass();
		$table = $orm->_table;
		$sqlSelect = $db->select()
				->from($table)
				->order($table.'.dateTime DESC');
		foreach($filters as $key=>$value) {
			switch ($key) {
				case 'userId':
					$sqlSelect->where($key.' = ?',(int)$value);
					break;
				case 'visitId':
					$sqlSelect->join('claimLines','claimFiles.claimIds REGEXP CONCAT(\'(\',claimLines.claimId,\',)|\',claimLines.claimId,\'$\')')
						->where('claimLines.visitId = ?',(int)$value)
						->group('claimLines.visitId');
					break;
			}
		}
		trigger_error($sqlSelect->__toString());
		$this->_dbSelect = $sqlSelect;
		$this->_dbStmt = $db->query($this->_dbSelect);
	}

}
