<?php
return [
    'components' => [
        'db' => [
            'class' => \yii\db\Connection::class,
            'dsn' => 'mysql:host=' . env('DB_HOST') . ';dbname=' . env('DB_NAME'),
            'username' => env('DB_USER'),
            'password' => env('DB_PASSWORD'),
            'charset' => 'utf8',
            'enableSchemaCache' => true,
            'schemaCacheDuration' => 3600,
        ],
        'mailer' => [
            'class' => \yii\symfonymailer\Mailer::class,
            'viewPath' => '@common/mail',
            'useFileTransport' => false,
            'transport' => [
                'scheme' => 'smtps',
                'host' => env('SMTP_HOST', 'smtp.gmail.com'),
                'username' => env('SMTP_USER'),
                'password' => env('SMTP_PASS'),
                'port' => env('SMTP_PORT', 465),
                'dsn' => 'native://default',
            ],
        ],
        'cache' => [
            'class' => \yii\caching\FileCache::class,
        ],
    ],
];