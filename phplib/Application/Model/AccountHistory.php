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
		* История счёта
		* @param string $session_id - идентификатор сессии пользователя
		* @return array - история счёта счёте
		*/
		public function info( $session_id ) {
			$sth = $this->dbh->prepare( '
SELECT
	`ah1`.`id` ,
	`ah1`.`amount` ,
	`ah1`.`created` ,
	`ah1`.`array`
FROM
	`account_history` AS `ah1`

	INNER JOIN `account` AS `a1` ON
	( `a1`.`id` = `ah1`.`account_id` )

	INNER JOIN `session` AS `s1` ON
	( `s1`.`user_id` = `a1`.`user_id` )
WHERE
	( `s1`.`id` = :session_id )
ORDER BY
	`ah1`.`id` DESC ;
			' ) ;

			if ( ! $sth->execute( array(
				'session_id' => $session_id
			) ) ) {
				return null ;
			}

			return $sth->fetchAll( \PDO::FETCH_ASSOC ) ;
		}

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
			return $this->__fetchColumn( '
SELECT
	`fi_account_history`( :account_id , :amount , :array ) AS `account_history_id` ;
			' , array(
				'account_id' => $account_id ,
				'amount' => $amount ,
				'array' => false
			) ) ;
		}
	}