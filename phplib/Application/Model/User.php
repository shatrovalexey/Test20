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

			$session_id = $this->creator->session->create( $user_id ) ;

			if ( empty( $session_id ) ) {
				return null ;
			}

			return array(
				'session_id' => $session_id ,
				'user' => $this->info( $session_id ) ,
				'account' => $this->creator->account->info( $session_id ) ,
				'account_history' => $this->creator->account_history->info( $session_id )
			) ;
		}

		/**
		* Информация о пользователе
		* @param string $session_id - идентификатор сессии пользователя
		* @return array - информация о пользователе
		*/
		public function info( $session_id ) {
			$sth = $this->dbh->prepare( '
SELECT
	`u1`.`id` ,
	`u1`.`login` ,
	`u1`.`created`
FROM
	`user` AS `u1`

	INNER JOIN `session` AS `s1` ON
	( `u1`.`id` = `s1`.`user_id` )
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