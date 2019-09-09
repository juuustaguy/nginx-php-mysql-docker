# Yupe2 CMF in Docker containers #
----------------------------------
Репозиторий предназначен для быстрого старта Yupe2 в Docker контейнерах.

Для клонирования репозитория используйте команду:

	git clone git@source.amylabs.ru:yupe2/docker.git yupe2
	
Важно клонировать проект в папку с именем `yupe2`

Если этого не сделать то проект не взлетит) В планах изменить это поведение.

Для работы с репозиторием необходимы:
 - [Docker](https://docs.docker.com/engine/installation/)
 - [docker-compose](https://docs.docker.com/compose/install/)
 - [Git](https://git-scm.com/downloads)

Что бы контейнер смог скачать все зависимости Вам необходимо добавить ssh ключи в контейнер.

Например я создал ключ id_rsa.pub (+ id_rsa) и добавил его к своему аккаунту в репозитории Yupe2 - https://source.amylabs.ru

Ключи в docker контейнер добавляются в дирректорию ./docker/source/ssh:

    mkdir -p docker/source/ssh
    cp ~/.ssh/id_rsa docker/source/ssh
    cp ~/.ssh/id_rsa.pub docker/source/ssh

Более простой вариант - можно сделать символьную ссылку, например так:

    ln -s ~/.ssh docker/source/ssh

Или так:

    ./yupe2 link-ssh

Для заупска bash скрипта необходимо дать файлу "./yupe2" права на исполнение:

        chmod +x yupe2

### Возможности ./yupe2: ###

    $ ./yupe2
    usage: ./yupe2 [set-env] [check-env] [check-config]
                   [build] [build-nocache] [create] [install] [update]
                   [start] [stop] [restart] [ps] [init] [migrate] [link-ssh]

    description:
          set-env           - set application environment [ dev | prod ]
          check-env         - print message with current application environment name
          check-config      - check current environment configuration .yml file
          build             - build docker containers for application
          build-nocache     - force build docker containers for application without docker cached images
          create            - cd app && git clone git@source.amylabs.ru:yupe2/yupe2-project-template yupe
          install           - composer install --prefer-dist
          update            - composer update --lock
          start             - start application environment
          stop              - stop application environment
          restart           - restart application environment
          ps                - list of working containers in current environment
          init              - initialisation of Yupe2! application
          migrate           - docker exec -it yupe2_php_1 php yii migrate
          link-ssh          - ln -s ~/.ssh ./docker/source/ssh


    ./yupe2 set-env [ dev | prod ]

    See ./yupe2 --help to read about all commands.
    
- [Yupe2 http://localhost:11771](http://localhost:7771)
- [Backend http://localhost:11771/backend](http://localhost:7771/backend)
- [Adminer http://localhost:11772](http://localhost:7772)

Для инициализации Developer окружения выполняем команды по очереди:

    ./yupe2 set-env dev
    ./yupe2 create
    ./yupe2 link-ssh # пропускам если вручную скопированы ключики


После скачивания репозитория запускаем:

    ./yupe2 build
    ./yupe2 start
    ./yupe2 install
    ./yupe2 init
    ./yupe2 migrate

Для запуска xDebug в установках PhpStorm необходимо добавить server:

    Ctrl+Alt+S
    Languages & Frameworks -> PHP -> Servers -> + (Добавить)
    Name: yupe2.dev
    Host: localhost
    port: 11771
    галку напротив Use path mappings и добавить все папки приложения app/yupe в дирректорию /app

    Пример по умолчанию:
    ./app/yupe          -> /app
    ./app/yupe/vendor   -> /app/vendor
    ./app/yupe/web      -> /app/web
    
	-> Apply

Помощь
------
Документация:
- [Docker](https://docs.docker.com/)
- [docker-compose](https://docs.docker.com/compose/overview/)
- [Git](https://git-scm.com/downloads)