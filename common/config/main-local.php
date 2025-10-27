<?php
return [
    'components' => [
        'db' => [
            'class' => \yii\db\Connection::class,
            'dsn' => 'mysql:host=' . ($_ENV['MYSQLHOST'] ?? $_ENV['DB_HOST'] ?? 'localhost') . 
                     ';dbname=' . ($_ENV['MYSQLDATABASE'] ?? $_ENV['DB_NAME'] ?? 'railway') . 
                     ';port=' . ($_ENV['MYSQLPORT'] ?? $_ENV['DB_PORT'] ?? '3306'),

                     // 'mysql:host=localhost;dbname=keysardinha_db'

            'username' => $_ENV['MYSQLUSER'] ?? $_ENV['DB_USERNAME'] ?? $_ENV['DB_USER'] ?? 'root',
            'password' => $_ENV['MYSQLPASSWORD'] ?? $_ENV['DB_PASSWORD'] ?? '',
            'charset' => 'utf8',
            'enableSchemaCache' => true,
            'schemaCacheDuration' => 3600,
            'attributes' => [
                PDO::ATTR_TIMEOUT => 10,
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            ],
        ],  
        'cache' => [
            'class' => \yii\caching\FileCache::class,
        ],
        'mailer' => [
            'class' => \yii\symfonymailer\Mailer::class,
            'viewPath' => '@common/mail',
            'useFileTransport' => true,
        ],
    ],
];