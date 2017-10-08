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
Ключи в docker контейнердобавляются в дирректорию ./docker/source/ssh:

    cp ~/.ssh/id_rsa docker/source/ssh
    cp ~/.ssh/id_rsa.pub docker/source/ssh

Можно сделать символьную ссылку, например так:

    ln -s ~/.ssh docker/source/ssh

Для заупска bash скрипта управления Yupe2 приложением в Docker контейнерах необходимо дать файлу "./yupe2" права на исполнение:

        chmod +x yupe2

### Возможности ./yupe2: ###

    $ ./yupe2
    usage: ./yupe2 [set-env] [check-env] [check-config]
                  [build] [build-nocache] [create] [install] [update]
                  [start] [stop] [ps] [restart] [db-backup] [db-restore]

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


    ./yupe2 set-env [ dev | prod ]

    See ./yupe2 --help to read about all commands.
    
[Yupe2 http://localhost:11771](http://localhost:7771)
[Backend http://localhost:11771/backend](http://localhost:7771/backend)
[Adminer http://localhost:11772](http://localhost:7772)

Для инициализации Developer окружения выполняем команды по очереди:

    ./yupe2 set-env dev
    ./yupe2 create

    После этого нужно обновить два файла composer.json и main-local.php, а затем продолжить выполнение команд

    ./yupe2 build
    ./yupe2 start
    ./yupe2 install
    ./yupe2 init
    ./yupe2 migrate

После запуска ./yupe2 create необходимо изменить два файла в клонированном проекте:

./app/yupe/config/main-local.php должен быть таким:

    <?php

    return [
        'aliases' => [
            '@frontendUrl' => 'http://localhost:11771',
            '@backendUrl' => 'http://localhost:11771/backend',
            '@staticUrl' => 'http://localhost:11771/static',
            '@bower' => '@vendor/bower-asset',
            '@npm'   => '@vendor/npm-asset',
        ],
        'components' => [
            'db' => [
                'class' => 'yii\db\Connection',
                'dsn' => 'mysql:host=db;dbname=db_yupe',
                'username' => 'yupe',
                'password' => '123',
                'charset' => 'utf8',
                'enableSchemaCache' => false,
            ],
            'cache' => [
                'class' => \yii\caching\DummyCache::className()
            ]
        ],
    ];

./app/yupe/composer.json должен быть таким:

    {
        "name": "yupe/yupe2-project-template",
        "description": "Project template for Yupe2 platform",
        "keywords": ["yii2", "framework", "yupe", "platform"],
        "homepage": "http://yupe.ru/",
        "type": "project",
        "license": "BSD-3-Clause",
        "support": {
            "issues": "https://source.amylabs.ru/yupe2/yupe2-project-template/issues",
            "source": "https://source.amylabs.ru/yupe2/yupe2-project-template/tree/master"
        },
        "repositories": [
            {
                "type": "composer",
                "url": "https://packages.amylabs.ru"
            },
            {
                "type": "composer",
                "url": "https://asset-packagist.org"
            }
        ],
        "minimum-stability": "dev",
        "require": {
            "yupe/yupe2-platform": "dev-master",
            "amylabs/yupe2-settings": "dev-master",
            "amylabs/yupe2-mail": "dev-master",
            "amylabs/yupe2-cron": "dev-master",
            "amylabs/yupe2-user": "dev-master",
            "amylabs/yupe2-rbac": "dev-master",
            "amylabs/yupe2-image": "dev-master",
            "amylabs/yupe2-upload": "dev-master",
            "amylabs/yupe2-theme-adminlte": "dev-master",
            "amylabs/yupe2-panel": "dev-master",
            "amylabs/yupe2-demo": "dev-master",
            "amylabs/yupe2-content": "dev-master"
        },
        "require-dev": {
            "codeception/codeception": "2.2.6",
            "yiisoft/yii2-faker": "*",
            "amylabs/yupe2-gii": "dev-master",
            "amylabs/yupe2-debug": "dev-master"
        },
        "config": {
            "process-timeout": 1800
        },
        "extra": {
            "merge-plugin": {
                "include": [
                    "plugins/*/*/composer.json"
                ],
                "recurse": false,
                "replace": false,
                "merge-extra": true
            }
        }
    }

После изменения этих файлов можно запустить

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