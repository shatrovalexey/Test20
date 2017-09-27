<?php
	/** пакет моделей
	* @package Application описанные классы задачи
	* @author Shatrov Aleksej <mail@ashatrov.ru>
	*/
	namespace Application\Model ;

	/** класс модели пользователя
	* @subpackage \Application\Model модель
	* @author Shatrov Aleksej <mail@ashatrov.ru>
	*/
	class User extends \Application\Model {
		/**
		* Авторизация пользователя
		* @param string $login - логин
		* @param string $passwd - пароль
		* @return string - идентификатор сессии
		*/
		public function login( $login , $passwd ) {
			$user_id = $this->__fetchColumn( '
SELECT
	`fs_user`( :login , :passwd ) AS `user_id` ;
			' , array(
				'login' => $login ,
				'passwd' => $passwd
			) ) ;

			if ( empty( $user_id ) ) {
				return null ;
			}

			return $this->creator->session->create( $user_id ) ;
		}

		/**
		* Создание пользователя
		* @param string $login - логин
		* @param string $passwd - пароль
		* @return int - идентификатор пользователя
		*/
		public function register( $login , $passwd ) {
			return $this->__fetchColumn( '
SELECT
	`fi_user`( :login , :passwd ) AS `user_id` ;
			' )->execute( array(
				'login' => $login ,
				'passwd' => $passwd
			) ) ;
		}
	}