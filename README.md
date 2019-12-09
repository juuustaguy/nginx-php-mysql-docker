# OkoCRM in Docker containers #
----------------------------------
Репозиторий предназначен для быстрого старта OkoCRM в Docker контейнерах.

Для клонирования репозитория используйте команду:

	git clone git@bitbucket.org:bttree/docker-okocrm.git okocrm
	
Важно клонировать проект в папку с именем `okocrm`

Если этого не сделать то проект не взлетит) В планах изменить это поведение.

Для работы с репозиторием необходимы:
 - [Docker](https://docs.docker.com/engine/installation/)
 - [docker-compose](https://docs.docker.com/compose/install/)
 - [Git](https://git-scm.com/downloads)

Для заупска bash скрипта необходимо дать файлу "./oko" права на исполнение:

        chmod +x oko

Устанавливаем окружение:

        ./oko set-env dev

Что бы контейнер смог скачать все зависимости Вам необходимо добавить ssh ключи в контейнер.

Для корректной работы необходимо, что б в директории ~/.ssh на ОС лежали ключи, добавленные в аккаунт репозитория

Ключи в docker контейнер добавляются командой:

    ./oko link-ssh
    
### Возможности ./oko: ###

    $ ./oko
    usage: ./oko [set-env] [check-env] [check-config]
                   [build] [build-nocache] [create] [install] [update]
                   [start] [stop] [restart] [ps] [init] [migrate] [link-ssh]

    description:
          set-env           - set application environment [ dev | prod ]
          check-env         - print message with current application environment name
          check-config      - check current environment configuration .yml file
          build             - build docker containers for application
          build-nocache     - force build docker containers for application without docker cached images
          create            - cd app && git clone git@bitbucket.org:bttree/yupe2-project-template.git okocrm
          install           - composer install --prefer-dist
          update            - composer update --lock
          start             - start application environment
          stop              - stop application environment
          restart           - restart application environment
          ps                - list of working containers in current environment
          init              - initialisation of OkoCRM application
          migrate           - docker exec -it yokocrm_php_1 php yii migrate
          link-ssh          - ln -s ~/.ssh ./docker/source/ssh


    ./oko set-env [ dev | prod ]

    See ./oko --help to read about all commands.
    
- [OkoCRM http://okocrm.local:8088](http://okocrm.local:8088)
- [Backend http://okocrm.local:8088/backend](http://okocrm.local:8088/backend)

Для инициализации Developer окружения выполняем команды по очереди:

    ./oko create

После создания приложения запускаем:

    ./oko build
    ./oko start
    ./oko install
    ./oko init
    ./oko migrate

Для запуска xDebug в установках PhpStorm необходимо добавить server:

    Ctrl+Alt+S
    Languages & Frameworks -> PHP -> Servers -> + (Добавить)
    Name: okocrm.local
    
    галку напротив Use path mappings и добавить все папки приложения app/okocrm в дирректорию /app

    Пример по умолчанию:
    ./app/okocrm          -> /app
    ./app/okocrm/vendor   -> /app/vendor
    ./app/okocrm/web      -> /app/web
    
	-> Apply

Помощь
------
Документация:
- [Docker](https://docs.docker.com/)
- [docker-compose](https://docs.docker.com/compose/overview/)
- [Git](https://git-scm.com/downloads)