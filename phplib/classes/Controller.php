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
		* Получение значения HTTP-аргумента
		* @param string $name имя переменной HTTP-запроса
		* @return mixed
		*/
		public function arg( $name ) {
			$request = &$this->creator->request ;

			if ( ! isset( $request[ $name ] ) ) {
				return null ;
			}

			return $request[ $name ] ;
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
		* view - имя файла представления
		* result - дополнительные данные для обработки запроса
		* result.data - данные для вывода в теле HTTP-ответа
		* result.passthru - выводить представление не внутри общего представления, а сразу
		* result.key - имя переменной для присвоения массива сообщений
		*/
		public function loginAction( ) {
			// обработка HTTP-аргумента "action"
			$this->user->action( ) ;

			return array(
				'result' => array(
					'data' =>  $this->user->login( )
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
		* Информация о счёте пользователя
		* @return array инструкции для дальнейшей обработки запроса
		* view - имя файла представления
		* result - дополнительные данные для обработки запроса
		* result.data - данные для вывода в теле HTTP-ответа
		* result.passthru - выводить представление не внутри общего представления, а сразу
		* result.key - имя переменной для присвоения массива сообщений
		*/
		public function accountAction( ) {
			return array(
				'result' => array(
					'data' => $this->account->get( )
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
		* Информация о транзакциях счёта пользователя
		* @return array инструкции для дальнейшей обработки запроса
		* view - имя файла представления
		* result - дополнительные данные для обработки запроса
		* result.data - данные для вывода в теле HTTP-ответа
		* result.passthru - выводить представление не внутри общего представления, а сразу
		* result.key - имя переменной для присвоения массива сообщений
		*/
		public function account_historyAction( ) {
			return array(
				'result' => array(
					'data' =>  $this->account_history->get( )
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
	}
