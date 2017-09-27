<?php
	/** пакет моделей
	* @package Application описанные классы задачи
	* @author Shatrov Aleksej <mail@ashatrov.ru>
	*/
	namespace Application\Model ;

	/** класс модели транзакций счёта
	* @subpackage \Application\Model модель
	* @author Shatrov Aleksej <mail@ashatrov.ru>
	*/
	class AccountHistory extends \Application\Model {
		/**
		* Ввод средств на счёт
		* @param int $user_id - идентификатор пользователя
		* @param double $amount - сумма для вывода
		* @return int - идентификатор транзакции
		*/
		public function createCredit( $account_id , $amount ) {
			$this->dbh->query( '
INSERT INTO
	`account_history`
SET
	`account_id` := :account_id ,
	`amount` := :amount ,
	`array` := :array ;
			' )->execute( array(
				'account_id' => $account_id ,
				'amount' => $amount ,
				'array' => true
			) ) ;

			return $this->dbh->lastInsertId( ) ;
		}

		/**
		* Вывод средств со счёта
		* @param int $user_id - идентификатор пользователя
		* @param double $amount - сумма для вывода
		* @return int - идентификатор транзакции
		*/
		public function createDebit( $account_id , $amount ) {
			$this->dbh->query( '
INSERT INTO
	`account_history`(
		`account_id` ,
		`amount` ,
		`array`
	)
SELECT SQL_SMALL_RESULT
	`a1`.`id` AS `account_id` ,
	:amount AS `amount` ,
	:array AS `array`
FROM
	`account` AS `a1`
WHERE
	( `a1`.`id` = :account_id ) AND
	( `a1`.`amount` >= :amount )
LIMIT 1 ;
			' )->execute( array(
				'account_id' => $account_id ,
				'amount' => $amount ,
				'array' => false
			) ) ;

			return $this->dbh->lastInsertId( ) ;
		}
	}