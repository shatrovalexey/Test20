### Тестовое задание ###
* описание в файле "Backend_developer_test_task.docx".

### Настройка и установка ###
* `'/bin/sh' 'run.sh'`

Подробнее об установке и настройке.
* `git clone 'https://github.com/shatrovalexey/Test20'`;
* `composer install`;
* создать БД `test3` и пользователя 'test' с паролем 'test' для неё;
* загрузить в БД `test3` структуру и данные из файла "database.sql";
* изменить пользователя и группу для всех файлов на требуемые для работы в "apache2";
* настроить виртуальный хост с DocumentRoot="www".

### Список файлов ###
* phplib/ - классы проекта
* * config.json - настройки проекта
* * init.php - инициализация окружения для пакета Application
* * Application/ - пакет Application
* ** Base.php - базовый класс для всех прочих
* ** Application.php - обработчик запросов
* ** Controller.php - контроллер
* ** Model.php - общий класс для моделей
* ** Model/ - модели
* *** User.php - пользователь
* *** Session.php - сессия
* *** Account.php - счёт
* *** AccountHistory.php - транзакции счёта
* ** Router.php - маршрутизатор
* ** View.php - представление
* view/ - представления
* * default.tpl - общее представление ("рамка" вокруг контента)
* * index.tpl - представление главной страницы
* * json.tpl - представление для JSON
* www/ - файлы для входа обработки HTTP-запросов
* * .htaccess - дополнительные настройки Apache2
* * index.php - запуск обработки HTTP-запросов
* * css/ - CSS
* * js/ - JavaScript

### Автор ###
Шатров Алексей Сергеевич <mail[at]ashatrov.ru>