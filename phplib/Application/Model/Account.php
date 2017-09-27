<?php
	/** пакет моделей
	* @package Application описанные классы задачи
	* @author Shatrov Aleksej <mail@ashatrov.ru>
	*/
	namespace Application\Model ;

	/** класс модели счёта
	* @subpackage \Application\Model модель
	* @author Shatrov Aleksej <mail@ashatrov.ru>
	*/
	class Account extends \Application\Model {
		/**
		* Ввод средств
		* @param int $user_id - идентификатор пользователя
		* @param double $amount - сумма для вывода
		* @return int - идентификатор транзакции
		*/
		public function withdrawal( $user_id , $amount ) {
			$account_id = $this->id( $user_id ) ;

			return $this->creator->account_history->createCredit( $account_id , $amount ) ;
		}
		/**
		* Вывод средств со счёта
		* @param int $user_id - идентификатор пользователя
		* @param double $amount - сумма для вывода
		* @return int - идентификатор транзакции
		*/
		public function fund( $user_id , $amount ) {
			$account_id = $this->id( $user_id ) ;

			return $this->creator->account_history->createDebit( $account_id , $amount ) ;
		}

		/**
		* Идентификатор счёта по идентификатору пользователя
		* @param int $user_id - идентификатор пользователя
		* @return int - идентификатор счёта
		*/
		public function id( $user_id ) {
			return $this->__fetchColumn( '
SELECT SQL_SMALL_RESULT
	`a1`.`id` AS `account_id`
FROM
	`account` AS `a1`
WHERE
	( `a1`.`user_id` = :user_id )
LIMIT 1 ;
			' , array(
				'user_id' => $user_id
			) ) ;
		}

		/**
		* Информация о счёте
		* @param string $session_id - идентификатор сессии пользователя
		* @return array - информация о счёте
		*/
		public function info( $session_id ) {
			$sth = $this->dbh->prepare( '
SELECT SQL_SMALL_RESULT
	`a1`.`id` ,
	`a1`.`amount` ,
	`a1`.`created`
FROM
	`account` AS `a1`

	INNER JOIN `session` AS `s1` ON
	( `s1`.`user_id` = `a1`.`user_id` )
WHERE
	( `s1`.`id` = :session_id )
LIMIT 1 ;
			' ) ;

			if ( ! $sth->execute( array(
				'session_id' => $session_id
			) ) ) {
				return null ;
			}

			return $sth->fetch( \PDO::FETCH_ASSOC ) ;
		}
	}