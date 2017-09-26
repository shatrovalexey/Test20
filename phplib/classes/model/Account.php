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
		* Вывод средств со счёта
		* @param int $user_id - идентификатор пользователя
		* @param double $amount - сумма для вывода
		* @return int - идентификатор транзакции
		*/
		public function withdrawal( $user_id , $amount ) {
			$account_id = $this->id( $user_id ) ;

			return $this->creator->account_history->create( $account_id , $amount , true ) ;
		}

		/**
		* Идентификатор счёта по идентификатору пользователя
		* @param int $user_id - идентификатор пользователя
		* @return int - идентификатор счёта
		*/
		public function id( $user_id ) {
			foreach ( $this->dbh->query( '
SELECT
	`a1`.`id` AS `account_id`
FROM
	`account` AS `a1`
WHERE
	( `a1`.`user_id` = :user_id )
			' )->fetchAll( \PDO::FETCH_NUM ) as $i => $row ) {
				return $row[ 0 ] ;
			}

			return null ;
		}
	}