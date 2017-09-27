<?php
	/** пакет моделей
	* @package Application описанные классы задачи
	* @author Shatrov Aleksej <mail@ashatrov.ru>
	*/
	namespace Application\Model ;

	/** класс модели сессии
	* @subpackage \Application\Model модель
	* @author Shatrov Aleksej <mail@ashatrov.ru>
	*/
	class Session extends \Application\Model {
		/**
		* Идентификатор сессии
		* @param int $user_id - идентификатор пользователя
		* @return string - идентификатор сессии
		*/
		public function id( $user_id ) {
			return $this->dbh->__fetchColumn( '
SELECT
	`fs_session`( :user_id ) AS `session_id` ;
			' , array(
				'user_id' => $user_id
			) ) ;
		}

		/**
		* Создать сессию
		* @param int $user_id - идентификатор пользователя
		* @return string - идентификатор сессии
		*/
		public function create( $user_id ) {
			return $this->__fetchColumn( '
SELECT
	`fi_session`( :user_id , :expires ) ;
			' , array(
				'user_id' => $user_id ,
				'expires' => $this->creator->creator->config->session->expires
			) ) ;
		}
	}