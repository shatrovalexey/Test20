<?php
	/** класс для согласованного выполнения программ пакета
	* @package Application описанные классы задачи
	* @author Shatrov Aleksej <mail@ashatrov.ru>
	*/

	namespace Application ;

	/**
	* @subpackage Application\Controller контроллер
	*/
	class Controller extends Base {
		/**
		* Создание объекта
		* @param stdclass $creator ссылка на объект-создатель
		*/
		public function __construct( $creator = null ) {
			// вызов метода родителя
			parent::__construct( $creator ) ;

			/**
			* @var Application\Model\User $user - объект модели пользователя
			*/
			$this->user = new Model\User( $this ) ;

			/**
			* @var Application\Model\Account $account объект модели счёта
			*/
			$this->account = new Model\Account( $this ) ;

			/**
			* @var Application\Model\AccountHistory $account_history объект модели истории счёта
			*/
			$this->account_history = new Model\AccountHistory( $this ) ;
		}

		/**
		* Получение значений HTTP-аргументов.
		* @param array $name имена аргументов HTTP-запроса
		* @return mixed
		* если передано только одно имя аргумента, то возвращается скаляр,
		* если передано много имён, то возвращает массив
		*/
		protected function __arg( ) {
			$request = &$this->creator->request ;
			$result = array( ) ;

			foreach ( func_get_args( ) as $name ) {
				if ( ! isset( $request[ $name ] ) ) {
					$result[] = null ;

					continue ;
				}

				$result[] = $request[ $name ] ;
			}

			if ( count( $result ) == 1 ) {
				return $result[ 0 ] ;
			}

			return $result ;
		}

		/**
		* Оформление ответа для вывода в формате JSON
		* @return array инструкции для дальнейшей обработки запроса
		* view - имя файла представления
		* result - дополнительные данные для обработки запроса
		* result.data - данные для вывода в теле HTTP-ответа
		* result.passthru - выводить представление не внутри общего представления, а сразу
		* result.key - имя переменной для присвоения массива сообщений
		*/
		protected function __json( &$data ) {
			return array(
				'result' => array(
					'data' => $data
				) ,
				'view' => 'json' ,
				'headers' => array(
					array(
						$this->creator->config[ 'http' ][ 'header' ][ 'default_name' ] ,
						$this->creator->config[ 'http' ][ 'header' ][ 'javascript' ]
					)
				) ,
				'key' => 'message' ,
				'passthru' => true
			) ;
		}

		/**
		* Идентификаторы пользователя
		* @return array
		* string( 32 ) $session_id - идентификатор сессии
		* int $user_id  - идентификатор пользователя
		*/
		protected function __ids( ) {
			$session_id = $this->__arg( 'session_id' ) ;
			$user_id = $this->session->get( $session_id ) ;

			return array(
				$session_id ,
				$user_id
			) ;
		}

		/**
		* Главная страница
		* @return array инструкции для дальнейшей обработки запроса
		* view - имя файла представления
		* result - дополнительные данные для обработки запроса
		*/
		public function indexAction( ) {
			return array(
				'view' => 'index' ,
				'result' => array( )
			) ;
		}

		/**
		* Авторизация пользователя
		* @return array инструкции для дальнейшей обработки запроса
		*/
		public function loginAction( ) {
			list( $login , $passwd ) = $this->__arg( 'login' , 'passwd' ) ;
			$result = $this->user->login( $login , $passwd ) ;

			return $this->__json( $result ) ;
		}

		/**
		* Информация о счёте пользователя
		* @return array инструкции для дальнейшей обработки запроса
		*/
		public function accountAction( ) {
			list( , $user_id ) = $this->__ids( ) ;
			$result = $this->account->get( $user_id ) ;

			return $this->__json( $result ) ;
		}

		/**
		* Информация о транзакциях счёта пользователя
		* @return array инструкции для дальнейшей обработки запроса
		*/
		public function account_historyAction( ) {
			list( , $user_id ) = $this->__ids( ) ;
			$result = $this->account_history->get( $user_id ) ;

			return $this->__json( $result ) ;
		}
	}
