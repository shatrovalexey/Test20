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
		* Вывод средств со счёта
		* @param int $user_id - идентификатор пользователя
		* @param double $amount - сумма для вывода
		* @param boolean $array - "0" - дебит, "1" - кредит
		* @return int - идентификатор транзакции
		*/
		public function create( $account_id , $amount , $array ) {
			$account_id = $this->id( $user_id ) ;

			if ( $this->dbh->query( "
INSERT INTO
	`account_history`
SET
	`account_id` := :account_id ,
	`amount` := :amount ,
	`array` := :array ;
			" ) ) {
				return $this->__last_insert_id( ) ;
			}

			return null ;
		}
	}